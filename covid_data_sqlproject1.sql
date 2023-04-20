Select Location,date ,total_cases,new_cases,total_deaths,population
from Portfolio_project..CovidDeaths$
where continent is not null
order by 1,2

--Total Cases Vs Total Deaths
--what percentage of population got covid
Select Location,date ,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from Portfolio_project..CovidDeaths$
where Location='India' and continent is not null
order by 1,2

--Total Cases vs Population
--Shows What Percentage of population got covid
Select Location,date ,population,total_cases,(total_cases/population)*100 as PercentPopulationInfected
from Portfolio_project..CovidDeaths$
where Location='India' and continent is not null
order by 1,2
 
--Countries with Highest Infection Rate compared to Population
Select Location,population,Max(total_cases) as HighestInfectionCount,Max( (total_cases/population))*100 as PercentPopulationInfected 
from Portfolio_project..CovidDeaths$
where continent is not null
group by Location,population
order by PercentPopulationInfected desc

Select Location,population,date,Max(total_cases) as HighestInfectionCount,Max( (total_cases/population))*100 as PercentPopulationInfected 
from Portfolio_project..CovidDeaths$
group by Location,population,date
order by PercentPopulationInfected desc

--Countries with Highest Death Count Per Population
Select Location,Max(cast(total_deaths as int)) as TotalDeathCount
from Portfolio_project..CovidDeaths$
where continent is not null
group by Location
order by TotalDeathCount desc

--Continents with Highest Death Count Per Population
Select location,Max(cast(total_deaths as int)) as TotalDeathCount
from Portfolio_project..CovidDeaths$
Where continent is null 
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc

--Global Numbers
Select SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from Portfolio_project..CovidDeaths$
where continent is not null

order by 1,2


