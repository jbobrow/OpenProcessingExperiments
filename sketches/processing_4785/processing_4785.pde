
PImage camion;

size(300,200);
//no olvides colocar la imagen que quieres cargar 
//adentro de la carpeta "data" adentro de la carpeta de tu programa
camion = loadImage("camion_atenco.jpg");
image(camion,0,0,300,200);

//prueba las siguentes filtros uno por uno
//el filtro THRESHOLD recibe un parametro de 0.0 a 1.0
//filter(THRESHOLD,.8);
//filter(GRAY);
//filter(INVERT);
//el parametro a POSTERIZE limite el numero de colores en cada canal 
//filter(POSTERIZE, 4);
//filter(BLUR, 6);


