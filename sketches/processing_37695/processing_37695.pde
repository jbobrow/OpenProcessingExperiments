
void setup(){

size(500,500);
frameRate(9);

colorMode(RGB,width);

for(int y=0; y<height; y++){
  for(int x=0; x<width; x++){
    stroke(width+400,250+x,y/2);
    point(x,y);
  }
}
}

int a = 400; 
int b = 100;
int c =200;


void draw(){
  fill(490,290,290,30);
  strokeWeight(1);
  stroke(390,190,800,40);
  pushMatrix();
    translate(width/2,height/100);  
    rotate(radians(a++));          
    translate(200,200);           
    rotate(radians(b*c + 200));     
    rect(c/width,150/width,50/width,height*a);     
   translate(300,30);           
    rotate(radians(b*c + 200*a));     
    rect(a/width,150,500,400);       
  popMatrix();
  
    b=400/width;
  a++;
  c=8*height;

}

