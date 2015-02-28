
int w=500;                       
float s,s15,s3,s6,h,h2,h3,h6,PI3=PI/3,mx,my; 
color BG=0x25EEEEEE,SC=0x250050FF;         

void draw (){} 
void setup(){         
  s=w/12f;                                    
  h=.5*sqrt(3*sq(s));                         
  s15=s*1.5;s3=s*3;s6=s*6;h2=h*2;h3=h*3;h6=h*6; 
  size(500,504); //normally it´d be (w,floor(h*14))
  smooth();
  background(BG);
  noLoop();
}
 
void mouseDragged(){
  noStroke();fill(BG);rect(0,0,width,height);stroke(SC);noFill();
  for(int j=0;j<=height;j+=h2) for(int i=0;i<=width;i+=s3){hipnosis (i,j);hipnosis (i+(s15),j+h);}  
  redraw();  
}
 
void hipnosis (float x, float y){   
  mx=map(mouseX,0,width,s,s3); my=map(mouseY,0,height,h,h3);      
  pushMatrix();
  translate(x,y);
  for (float a=0; a<=TWO_PI; a+=PI3){                  
    pushMatrix();
    rotate(a);   
    triangle(0,0,-mx,my,mx,my);
    popMatrix();
    }
  popMatrix();
}
                                                                                                                                                            
