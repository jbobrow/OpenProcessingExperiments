
size(500,500);
// El iniciador es"int i = 20", la condición es"i < 80",
// y la actualización es "i += 5". Cabe notar que el
// punto-y-coma termina los dos primeros elementos
for (int i = 20; i < 400; i += 10) {
// Esta línea continuará ejecutándose hasta que “i”
// sea mayor a 80.
line(20, i, 400, i+15);
}
