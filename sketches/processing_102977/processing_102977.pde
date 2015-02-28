
size(500, 500);
for (int x = 0; x < 500; x++) {
 float n = norm(x, 0.0, 500.0);
 float y = pow(n, 4 );
 y *= 100;
 point(x, y); 
}

// sq(valor) la función sq calcula el cuadrado de un número.
// float a = sq(9) asigna el valor 81

// la función sqrt() se utiliza para calcular la raíz cuadrada de un número
// float a = sqrt(6561) asigna 81 a la variable a

// la función pow() es usada para calcular un número elevado por el exponente
// que uno desee. Acepta dos parámetros
// pow(número, exponente)
// float a = pow(3, 4) = 3*3*3*3


// norm(valor, menor, mayor) El valor es el número a normalizar entre 0.0 y 1.0
// float x = norm(102.0, 0.0, 255.0); 
// asigna 0.4 a x
