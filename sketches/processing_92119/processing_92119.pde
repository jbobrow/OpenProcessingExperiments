
color[] gary = {#F26430, #0D0D0D, #F2F2F2, #F2A30F, #069DBF};
color[] palette = gary;

size(600, 200);
background(palette[0]);
smooth();

int[] array = (0, 2, 4, 6, 8, 16, 34, 68, 125, 300, 455, 570);
for(int i < 0; i < array.length; i++){
stroke(palette[1]);
strokeWeight(4);
float x = array[i];
ellipse(x, height/3, 50, 50);
}
