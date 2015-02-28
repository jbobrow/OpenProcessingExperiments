
void setup(){
  size(400,400);
} 
  float a;
  float r;
  float g;
  float b;

void draw(){

  for(int i=0; i<40; i++)
  {
    a = random(400);
    r = random(255);
    g = random(255);
    b = random(255);
   
    textSize(32);
    text("Hellow!!!", 200, 200);
    fill(r, g, b, a);
    ellipse(a,a/2,a/100+60,cos(a)*200+55+1);//수정부분1
    stroke(r,g,b,a);
    line(200,200,mouseX, mouseY);
    line(300+i,200,mouseX, mouseY);//수정부분2
    line(200,300+i,mouseX, mouseY);//수정부분3
}
}


                //더 정신 없어졌어요 ㅎㅎㅎ
                                
