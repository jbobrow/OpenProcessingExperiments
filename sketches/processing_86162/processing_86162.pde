
//Pixel Sorting - Univers 
int threshold, density, mode;
//threshold-порог: не больше 255
//density-плотность:1-плотно, 10-разрежено
//mode: 1-brightness, 2-hue, 3-saturation, 4-red, 5-blue, 6-green - всё снизу-вверх:кнопки-1,2,3,4,5,6
//mode: 7-brightness, 8-hue, 9-saturation, 10-red, 11-blue, 12-green - всё влево-вправо:кнопки-7,8,9,0,-,= 
//mode: 13-brightness, 14-hue, 15-saturation, 16-red, 17-blue, 18-green - всё двигается по диагонали: кнопки-q,w,e,r,t,y 
//mode: 19-brightness, 20-hue, 21-saturation, 22-red, 23-blue, 24-green - всё исчезает: кнопки-u,i,o,p,[,]
//Нажатие кнопки мыши выводит картинку-источник
//threshold: z=5,x=30,c=55,v=80,b=105,n=130,m=155,','=180,'.'=205,'/'=230
PImage img;

void setup() {
  threshold = 120;
  density = 1;
  mode =25;
  img = loadImage("1.jpg");
  size(img.width,img.height);
  //noLoop();
}
void draw() {
  /*if (mode >=  13 ) { loop();}
  if (mode >=  18 ) { noLoop();}
  */
  for (int w=0; w<img.width*img.height; w++) {
    if ((img.pixels[w]
