SELECT 
	t.gender AS Genero,
	t.age AS Idade,
	t.hypertension AS Hipertensao,
	t.heart_disease AS Doenca_Cardiaca,
	t.bmi AS IMC,
	CASE 
		WHEN t.bmi < 18.5 THEN 'Abaixo do peso'
		WHEN t.bmi > 18.5 AND t.bmi <= 24.9 THEN 'Peso ideal'
		WHEN t.bmi > 24.9 AND t.bmi <= 29.9 THEN 'Acima do peso'
		WHEN t.bmi > 29.9 THEN'Obesidade'
	END AS Cat_IMC,	
	t.HbA1c_level AS Nivel_Hemoglobina,
	t.blood_glucose_level AS Nivel_Glicose,
	CASE 
		WHEN t.smoking_status = 'no-info' THEN 'Sem informacoes'
		WHEN t.smoking_status = 'non-smoker' THEN 'Nao fumante'
		WHEN t.smoking_status = 'smoker' THEN 'Fumante'
	END AS Fumante,
	ROUND( (t.Probabilidades * 100), 2) AS Probabilidade_Diabetico_Porcentagem
FROM tbdiabetes t