
float yPos = 0;
float yDir = 1;



void setup (){
  
  size(400,300);
smooth();


}

void draw(){
  background(200);
  ellipse(200,150,yPos, height);

if (yPos >width){
yDir = -1;

}

if (yPos < 0){
  yDir = 1;

}

yPos = yPos + yDir;

println(yPos + " " + yDir);






}
