
size (500,500);
smooth();
background(0);
/* definições do programa*/

for ( int y = 1; y < 10; y++){
    for (int x = 1; x < 10; x = x+1) {
    /*processo que desenha as "bolas" na vertical e em seguida na horizontal
     ate o seu falor ser igual a 10*/
        noStroke();
        /*sem linha nas bolas*/
        fill (random (255), random (255), random (255));
        /*random das cores*/
        ellipse ( x*50, y*50, 20,20);
        /*desenho das bolas, com a sua posição a ser alterada em cada vez
        que o processo é realizado*/
    } 
}

