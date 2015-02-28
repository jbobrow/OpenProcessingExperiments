
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  
}

int a=5;
int x=0;
 int y=a+pow(x,2)/2a;
    
   
   

void draw() {  //draw function loops 

text(x+y,10,10);
//for(int i=0;i<10;i++){
  //  x++;
    //line(x,y,width/2,0);
      //}
}
