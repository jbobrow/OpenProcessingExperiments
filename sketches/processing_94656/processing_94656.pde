
void setup()
{
 size(600,600);
 background(118,37,37);
 smooth();
 noFill();
 strokeWeight(4);
 frameRate(10);
}

int i=1;

void draw(){
drawspiral(width/2,height/2,4);
}


void drawspiral(float centerx,float centery,int weight){
 float angleInc=PI/300;
 int colora=229;
 int colorb=176;
 int colorc=176;


 beginShape(TRIANGLE_STRIP);
 stroke(colora+(i%(255-colora)),colorb+(i%(255-colorb)),colorc+(i%(255-colorc)));
 vertex(weight*i/4*sin(i)+centerx,weight*i/4*cos(i)+centery);//,width/2);
 vertex(weight*(i+1)/4*sin(i+1)+centerx,weight*(i+1)/4*cos(i+1)+centery);//,height/2);
 vertex(weight*(i+2)/4*sin(i+2)+centerx,weight*(i+2)/4*cos(i+2)+centery);//,height/2);
 endShape();
 i++;
}
