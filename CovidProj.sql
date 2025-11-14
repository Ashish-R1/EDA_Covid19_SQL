-- Covid 19 Data Exploration 


USE Portfolio_proj;


SELECT *
FROM Portfolio_proj.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 3,4


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM Portfolio_proj.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 1, 2

-- Total Cases VS Total Deaths
-- Showes likelyhood of dying when infected with covid

SELECT location, date, total_cases, total_deaths, (total_deaths / total_cases)*100 AS DeathPercentage
FROM Portfolio_proj.dbo.CovidDeaths
WHERE location = 'India'
and  continent is not null
ORDER BY 1, 2

-- Total Cases VS Population
-- Percentage of population infected with Covid

SELECT location, date, population, total_cases, (total_cases / population)*100 AS PercentPopulationInfected
FROM Portfolio_proj.dbo.CovidDeaths
WHERE location = 'India'
and continent is not null
ORDER BY 1, 2

-- Countries with Highest Infection Rate compared to Population

SELECT location,  population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases / population)*100) AS PercentagePopulationInfected
FROM Portfolio_proj.dbo.CovidDeaths
WHERE continent is not null
GROUP BY location,  population
ORDER BY PercentagePopulationInfected DESC

-- Countries with Highest Death Count per Population
SELECT location, MAX(cast(total_deaths AS int)) as TotalDeathCount
FROM Portfolio_proj.dbo.CovidDeaths
WHERE continent is not null
GROUP BY location	
ORDER BY TotalDeathCount DESC

-- Contintents with the highest death count per population
Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Portfolio_proj.dbo.CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

-- Global Death percentage by date
Select Date, SUM(new_cases) as Total_cases ,SUM(cast(new_deaths as int)) 
as Total_deaths, SUM(cast(new_deaths as int)) / SUM(new_cases) * 100 as DeathPercentage
From Portfolio_proj.dbo.CovidDeaths
Where continent is not null 
Group by Date
ORDER BY 1, 2

Select SUM(new_cases) as Total_cases ,SUM(cast(new_deaths as int)) 
as Total_deaths, SUM(cast(new_deaths as int)) / SUM(new_cases) * 100 as DeathPercentage
From Portfolio_proj..CovidDeaths
Where continent is not null 
ORDER BY 1, 2

-- Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location,
dea.date) as RollingPeopleVaccinated
From Portfolio_proj..CovidDeaths dea
Join Portfolio_proj..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3


-- USE CTE
WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location,
dea.date) as RollingPeopleVaccinated
From Portfolio_proj..CovidDeaths dea
Join Portfolio_proj..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
)

SELECT *, (RollingPeopleVaccinated/population) * 100
FROM PopvsVac

--Temp Table

DROP Table if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continet varchar(255),
Location varchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location,
dea.date) as RollingPeopleVaccinated
From Portfolio_proj..CovidDeaths dea
Join Portfolio_proj..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date

SELECT *, (RollingPeopleVaccinated/population) * 100
FROM #PercentPopulationVaccinated

-- Creating View to store data for later visualizations

DROP VIEW IF EXISTS PercentPopulationVaccinated;
GO
Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_proj..CovidDeaths dea
Join Portfolio_proj..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

