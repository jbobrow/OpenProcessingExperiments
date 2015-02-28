
int x=0;
int y=55;

void setup(){
  size(300,300);
}

void draw(){
  background(65,55,160);
ellipse(x+20,y,x+40,y+40);
ellipse(x+60,y,x+40,y+40);
ellipse(x+20,y+97,x+40,y+40);
ellipse(x+60,y+97,x+40,y+40);
x= x+1;
if(x > 100)
x= 20;

}

