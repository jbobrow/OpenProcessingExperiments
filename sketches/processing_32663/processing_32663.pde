

void setup()
{
  size(500,500);
    
  background(0);
}
  
int z = 0;
int j = 500;
int k = 50;

//second time;
int d = 250;
int b = 250;
//-
int g = 250;
int e = 250;
//-
int p = 250;
int y = 250;
//-
int h = 250;
int f = 250;

//colours;
int c = 255;
int i = 0;
int n = 99;


void draw()
  {
    smooth();
    stroke(1,30);
    
    if(z>250){z=0;}
    if(j<250){j=500;}
    
    //second-part
    if(d>500){d=250;}
    if(b>500){b=250;}
    //-
    if(g<0){g=250;}
    if(e<0){e=250;}
    //-
    if(p>500){p=250;}
    if(y<0){y=250;}
    //-
    if(h<0){h=250;}
    if(f>500){f=250;}
    
    //colours  
    if(j>249)
    {  
      if(c<0){c=255;}  
      fill(i,n,255,100);
      triangle(250, 180, 200, 280, 300, 280);
      fill(n,i,255,100);
      triangle(250, 195, 215, 270, 285, 270);
      c=c-40;
      i=i+1;
      n=n+1;  
      if(i>255){i=0;}
      if(n>255){n=99;}
    }
    
    for(int i = 0; i < 20; i++){
    float x = random(0,500);
    float u = random(0,500);
    
    fill(noise(x/150.0,u/150.0)*150,0,255-noise(x/150.0,u/150.0)*100,150);
      
    ellipse(j,250,k,k); //middle right
    ellipse(250,j,k,k); //middle south 
    ellipse(250,z,k,k); //middle north
    ellipse(z,250,k,k); //middle left
    
      ellipse(d,b,k,k); //lower right corner
      ellipse(g,e,k,k); //upper left corner
      ellipse(p,y,k,k); //upper right corner
      ellipse(h,f,k,k); //lower left corner
    
    //second part
    d = d+1;
    b = b+1;
    g = g-1;
    e = e-1;
    p = p+1;
    y = y-1;
    h = h-1;
    f = f+1;  
    
    //first part
    z = z+1;        
    j = j-1;
    
    if(z>250){k=k+50;}
    if(k>100){k=50;}
    
} 

/*
void mouseClicked(){
    
    if(!recording){
    beginRecord(PDF, "pic.pdf");
    recording = true;
  }
  else
   endRecord(); 
   
   */
  

}

