
PFont miLetra;             
//println(PFont.list());       //enséñame todas las tipografías de la computadora

//Declara un arreglo de tipos de letras

String[] misLetras=PFont.list(); //String es una variable para texto y "[ ]" acomula series de numeros u objetos
//tambien se puede hacer: float[] pimage[] int[] String[] etc.
println(misLetras);


miLetra = createFont(misLetras[int(random(50,100))], 62); //saca la tipografia #64 o en random

textFont(miLetra);
text("Hola Mundo", 10,50);


