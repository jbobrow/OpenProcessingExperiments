
size (200 ,200);
colorMode (HSB ,360 ,1.0 ,1.0);
for (int i = 0; i < 360; i++) {
stroke(i, 1, 1); // Matiz i
line(i, 0, i, 100);
for (float j = 0.0; j <= 1; j+=0.01) {
stroke (i,j ,1); // Saturação j
point (i ,100+100* j);
stroke (i,1,j); // Valor j
point (i ,200+100* j);
}

}


smooth ();
stroke (255);
// circulos coloridos da direita para a esquerda
fill (0 ,255 ,144 , 128); ellipse (150 ,150 ,100 ,100);
fill (128 ,0 ,255 , 128); ellipse (100 ,150 ,100 ,100);
fill (255 ,128 ,0 , 128); ellipse (50 ,150 ,100 ,100);
// circulos coloridos da esquerda para a direita
fill (255 ,128 ,0 , 128); ellipse (50 ,50 ,100 ,100);
fill (128 ,0 ,255 , 128); ellipse (100 ,50 ,100 ,100);
fill (0 ,255 ,128 , 128); ellipse (150 ,50 ,100 ,100);
