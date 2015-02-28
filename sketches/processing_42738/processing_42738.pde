
int S=700,s=S/2,x,y,D;
void  draw(){}
void setup()
{size(700,700);smooth();noFill();stroke(0,30);}
void mouseDragged()
{for(background(y=S);y-->0;)for(x=0;x++<S;){if(dist(x,y,s,s)%(mouseX>>5)==0)ellipse(x,y,D=mouseY,D);}}   
                                                                                                                                                                                                                                                                
