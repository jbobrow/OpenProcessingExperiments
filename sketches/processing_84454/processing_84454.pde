
/**
 * Stochastic diferential equation explorer, with a experiment for making menus.
 * by Héctor Corte.
 * leo_corte@yahoo.es
 * 
 *The menu opens on the upper left corner. Just move the cursor over the smallest circles.
 *This is my first attemp, and it´s just an idea for future posibilities.
 *
 *The script solves 6 diferent stochastic differential equations (see down in "cases" to see what they are).
 *
 *
 *
 */
////////////////////////
////////////////////////
//Main menu
botonucu a=new botonucu (0, 0, 65, 0,color(123,23,190));
//First row of buttons
botonucu a0=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*0/3), 90*sin(TWO_PI/4/6+TWO_PI/4*0/3), 35, 0,color(223,23,190));
botonucu a1=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*1/3), 90*sin(TWO_PI/4/6+TWO_PI/4*1/3), 35, 0,color(190,223,23));
botonucu a2=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*2/3), 90*sin(TWO_PI/4/6+TWO_PI/4*2/3), 35, 0,color(23,190,223));
//Second row of buttons
//These ones are the ones that will allow us to change the equations.
botonucu a00=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*0/3)+50*cos(TWO_PI/4/8+TWO_PI/4*1/4), 90*sin(TWO_PI/4/6+TWO_PI/4*0/3)+50*sin(TWO_PI/4/8+TWO_PI/4*1/4), 15, 0,color(223,23,250));
botonucu a01=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*0/3)+50*cos(TWO_PI/4/8+TWO_PI/4*2/4), 90*sin(TWO_PI/4/6+TWO_PI/4*0/3)+50*sin(TWO_PI/4/8+TWO_PI/4*2/4), 15, 0,color(223,23,130));

botonucu a10=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*1/3)+50*cos(TWO_PI/4/8+TWO_PI/4*1/4), 90*sin(TWO_PI/4/6+TWO_PI/4*1/3)+50*sin(TWO_PI/4/8+TWO_PI/4*1/4), 15, 0,color(200,223,23));
botonucu a11=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*1/3)+50*cos(TWO_PI/4/8+TWO_PI/4*2/4), 90*sin(TWO_PI/4/6+TWO_PI/4*1/3)+50*sin(TWO_PI/4/8+TWO_PI/4*2/4), 15, 0,color(130,223,23));

botonucu a20=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*2/3)+50*cos(TWO_PI/4/8+TWO_PI/4*1/4), 90*sin(TWO_PI/4/6+TWO_PI/4*2/3)+50*sin(TWO_PI/4/8+TWO_PI/4*1/4), 15, 0,color(23,250,223));
botonucu a21=new botonucu (90*cos(TWO_PI/4/6+TWO_PI/4*2/3)+50*cos(TWO_PI/4/8+TWO_PI/4*2/4), 90*sin(TWO_PI/4/6+TWO_PI/4*2/3)+50*sin(TWO_PI/4/8+TWO_PI/4*2/4), 15, 0,color(23,130,223));

int choose=1;
///////////////////////

//These are parameters for integrating numerically the solutions. 
int n=1000;
int op=0;
float alfa=0.001;
float dt=2.5;
float minalfa=0;
float maxalfa=2.5;
float mindt=0;
float maxdt=2;
//Here we are going to store the solutions.
float[] x = new float[n];
float[] y = new float[n];
//This is for precharging some random numbers. It's not ideal, but speeds up things.
float[] r = new float[n];
float[] r2 = new float[n];
//Screen size
int aa=400;
int b=400;
//These arrays are for adding some visual efects.
//Like saturation when the solution passes several times over the same area.
float[] red_m= new float [aa*b];
float[] green_m= new float [aa*b];
float[] blue_m= new float [aa*b];
float[] reserve1=new float [aa*b];
float[] reserve2=new float [aa*b];
float[] reserve3=new float [aa*b];

void setup(){
  size(400,400);
  background(102);
  //frameRate(30);
  for(int o=0;o<aa*b;o++){
    red_m[o]=0;
    green_m[o]=0;
    blue_m[o]=0;
  }
  //Now we precharge the solution arrays
  x[0]=0;
  y[0]=0;
  x[1]=0;
  y[1]=0;
  //It's best to have new random numbers each time, but this makes it very slowly, so I generate them at the beguining and use them again and again.
    float w=100;
  float x1=0;
  float x2=0;
   for (int i=0;i<n-1;i++){
    while(w>=1){
      x1=2*random(1)-1;
      x1=2*random(1)-1;
      w=x1*x1+x2*x2;   
    }
    w=sqrt((-2*log(w))/2);
    float y1=x1*w;
    float y2=x2*w;
    r[i]=y1;
    r2[i]=y2;
   }
  
  
  // This command will generate the solution using the selected equation,
  // that is determined by the value of the variable choose.
  generar();
  //This command will plot the solution and generate the graphic efects.  
  dibujin(); 
}

//This is the main loop.
void draw(){
  ////Menus
  //This is for the menus, and rigth now it's a little tricky.
  //Put a circle in the corner.
  fill(color(123,23,190));
  ellipse(0,0, 45, 45);
  //This will update the main button, and check if you are over it or now.
  a.update();
  //If you are over the button, then it becames visible, and also the rest of buttons.
  //And remains in this state until you choose.
  if(a.visible>0){
    a0.visible=1; 
    a1.visible=1; 
    a2.visible=1;
    a00.visible=1; 
    //This ifs will determine if you are over one of the smaller circles
    // selecting one of the  possible equations.
    if(a00.selected>0){
      choose=1;
      a00.selected=0;
      a.visible=0;
    }
    a01.visible=1;
    if(a01.selected>0){
      choose=2;
      a01.selected=0;
      a.visible=0;
    }
    a1.visible=1;
    a10.visible=1; 
    if(a10.selected>0){
      choose=3;
      a10.selected=0;
      a.visible=0;
    }
    a11.visible=1;
    if(a11.selected>0){
      choose=4;
      a11.selected=0;
      a.visible=0;
    }
    a2.visible=1;
    a20.visible=1;
    if(a20.selected>0){
      choose=5;
      a20.selected=0;
      a.visible=0;
    } 
    a21.visible=1;
    if(a21.selected>0){
      choose=6;
      a21.selected=0;
      a.visible=0;
    }
    //Calling the updates here, will draw aech button.
    //I need to improve this putting buttons inside a list.
    a0.update();
    a00.update();
    a01.update();
    a1.update();
    a10.update();
    a11.update();
    a2.update();
    a20.update();
    a21.update();
  }
  else{
     background(0);
  // We are going to change to parameters in the equations,
  // the alfa factor (how much the white noise affects the equation).
  // And the factor dt, that is the size of the integration steps.
  // The parameters are set by moving the cursor over the screen.
  // Each equation has diferent ranges where it is interesting.
  alfa=map(mouseX,0,aa,minalfa,maxalfa);
  dt=map(mouseY,0,b,mindt,maxdt);
 
  //Now we are going to generate a new solution. And we start in the final point of the previous solution.
  x[0]=x[n-1];
  y[0]=y[n-1];
  //As in the setup, we call the function to make the solution.
  generar();
  //And the function to plot it.
  dibujin(); 
    
  }
    
}

void dibujin(){
  //This function is for plotting the solution and making some graphic effects.
  //We are going to iterate over all the points of the solution.
  for(int i=0;i<n-1;i++){
    //This are for turning solution points into integers and in the range of the actual screen.
    int m=round((x[i]+50)/100*aa);  
    if(m>aa-1){
      m=  aa-1;
    }
    if(m<0){
      m=0;
    }
    int l=round((y[i]+50)/100*b);
    if(l>b-1){
      l=  b-1;
    }
    if(l<0){
      l=0;
    }
    int m2=round((x[i+1]+50)/100*aa);  
    if(m2>aa-1){
      m2=  aa-1;
    }
    if(m2<0){
      m2=0;
    }
    int l2=round((y[i+1]+50)/100*b);
    if(l2>b-1){
      l2=  b-1;
    }
    if(l2<0){
      l2=0;
    }
    stroke(color(red_m[m+l*aa],green_m[m+l*aa],blue_m[m+l*aa]));
    //This is for adding colors where the solution lays.
    red_m[m+l*aa]=red_m[m+l*aa]+2.25;
    green_m[m+l*aa]=green_m[m+l*aa]+2.5;
    blue_m[m+l*aa]=blue_m[m+l*aa]+7;
    //This is actually where we plot a line between two solution points.
    line(m, l, m2, l2);  
  }
  //This bucle is for making some memory affect on the canvas.
  loadPixels();
  for(int o=0;o<aa*b;o++){
    red_m[o]=1.01*red_m[o]-0.01*red_m[o];
    green_m[o]=1.01*green_m[o]-0.1*green_m[o];
    blue_m[o]=1.01*blue_m[o]-0.01*blue_m[o];
    //This will create a persistent effect.
    reserve1[o]=0.95*reserve1[o]+red(pixels[o]);
    reserve2[o]=0.94*reserve2[o]+green(pixels[o]);
    reserve3[o]=0.93*reserve3[o]+blue(pixels[o]);
    //At last, we build again the pixels.
    pixels[o]= color(red(pixels[o])+0.9*reserve1[o],blue(pixels[o])+0.9*reserve2[o],blue(pixels[o])+0.9*reserve3[o]   );
    
  }
  
  

  updatePixels();
}

void generar(){
  //This function will create the solution.
  //To generate Gaussian random numbers ussing uniform random numbers, we use the:
  //Box-Muller trasnformation
  //Can be found here:
  // http://www.taygeta.com/random/gaussian.html
//  float w=100;
//  float x1=0;
//  float x2=0;
  for (int i=0;i<n-1;i++){
//    while(w>=1){
//      x1=2*random(1)-1;
//      x1=2*random(1)-1;
//      w=x1*x1+x2*x2;   
//    }
//    w=sqrt((-2*log(w))/2);
//    float y1=x1*w;
//    float y2=x2*w;
//    r[i]=y1;
//    r2[i]=y2;
    switch(choose){
      //Here, deppending on the selection we made, we use one or another equation for solution.
      case 1:  
      x[i+1]=x[i]-cos(y[i])*dt+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i])*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      //And set the range of parameters for this equation to show interesting results.
      minalfa=0;
      maxalfa=2.5;
      mindt=0;
      maxdt=2;
      break;
      
      case 2:
      x[i+1]=x[i]-cos(y[i]+x[i])*dt+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i])*dt-sin(0.4*x[i])*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      minalfa=0;
      maxalfa=2.5;
      mindt=0;
      maxdt=2;
      break;
     
      case 3:
      x[i+1]=x[i]-cos(y[i])*dt+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i])*x[i]*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      minalfa=-0.8;
      maxalfa=2;
      mindt=0;
      maxdt=1.25;
      break;
      
      case 4:
      x[i+1]=x[i]-cos(y[i]*x[i])*dt+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i]-cos(y[i]))*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      minalfa=0.25;
      maxalfa=2;
      mindt=0.5;
      maxdt=1.5;
      break;
      
      case 5:
      x[i+1]=x[i]-cos(y[i])*cos(x[i])*dt+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i])*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      minalfa=0;
      maxalfa=2.5;
      mindt=0;
      maxdt=2;
      break;
      
      case 6:
      x[i+1]=x[i]-0.1*cos(y[i])*dt-0.2*cos(y[i]-0.4)+alfa*sqrt(dt)*r[i]-0.01*x[i];
      y[i+1]=y[i]-sin(x[i])*dt+alfa*sqrt(dt)*r2[i]-0.01*y[i];
      minalfa=0;
      maxalfa=2.5;
      mindt=0;
      maxdt=2;
      break;
    }
  }
}

class botonucu{
  //This class will be used for generating the menu.
  float xpos, ypos, sizee ,visible, selected;
  color colorin;
  botonucu (float x, float y, float s, int visi,color c){
    xpos = x;
    ypos = y; 
    sizee = s;
    visible = visi; 
    selected=0;
    colorin=c;
  } 
  void update(){
    //When updated, it checks it's state and if mouse is over it. If mouse is over it, then it becames selected.
    if (sqrt((mouseX-xpos)*(mouseX-xpos)+(mouseY-ypos)*(mouseY-ypos))<15&& 0<mouseX && 0<mouseY){
     visible=1; 
     selected=1;
    }
    //If it is visble or mouse was over it, then it is showed.    
    if (visible > 0){
      fill(colorin);
      ellipse(xpos,ypos, sizee, sizee);
    }   
  } 
}


