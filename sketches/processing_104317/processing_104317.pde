
int S=700,s=S/2,x,y,D;
void  draw(){}
void setup()
{size(700,700);smooth();noFill();stroke(4,30);}
void mouseDragged()
{for(background(y=S);y-->4;)for(x=4;x++<S;){if(dist(x,y,s,s)%(mouseX>>4)==0)ellipse(x,y,D=mouseY,D);}}   
                                                                                                                                                                                                                                                                
