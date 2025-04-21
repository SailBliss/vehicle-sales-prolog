# Sistema de Gestión de Vehículos en Prolog  
*Práctica II - Lenguajes de Programación*  
**Universidad EAFIT** | *Profesor: Alexander Narváez Berrío*  
Programado por: David Castrillon e Isabela Ruiz  

---

## Descripción  
Sistema de consulta y reportes para concesionarios vehiculares implementado en Prolog, que permite:  
- Filtrar vehículos por marca, tipo, año y presupuesto.
- Generar reportes estructurados con `findall/3` y `bagof/3`.  
- Validar restricciones de inventario

---

## Consultas Principales
#### Ejemplo: SUVs bajo $30,000
?- meet_budget('SUV', 30000).

### Agrupar vehículos por marca (list_by_brand/2)
#### Ejemplo: Todos los vehículos Toyota
?- list_by_brand('Toyota', List).

### Generar reporte con restricción (generate_report/4)
#### Ejemplo: Sedanes Ford bajo $50,000
?- generate_report('Ford', 'Sedan', 50000, Result).

---

## Casos de Prueba 
### 1. Filtrado de SUVs Toyota bajo $30,000
?- findall(Ref, (vehicle('Toyota', Ref, 'SUV', Price, _), Price < 30000), Result).

### 2. Agrupamiento de vehículos Ford
?- bagof((Type, Year, Ref), vehicle('Ford', Ref, Type, _, Year), Inventory).

### 3. Cálculo de valor total de Sedanes
?- generate_report(_, 'Sedan', 500000, result(Vehicles, Total)).
