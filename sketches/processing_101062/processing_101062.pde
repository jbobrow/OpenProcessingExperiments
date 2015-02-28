
/*
Processing implementation by Henrique Silva
of the algorithm described in the paper
"Random discrete colour sampling" by
Henrik Lieng, Christian Richardt and Neil A. Dodgson,
Computer Laboratory, University of Cambridge, United Kingdom
Computational Aesthetics 2012
http://www.cl.cam.ac.uk/research/rainbow/projects/coloursampling/

This paper proposes an alternative to the tradicional 
random generator.

This is an application of three colors. 
The application can be easily extended to a different number of colors.

Mouse click to change the value of parameters Omega:
-Omega H to mouseX (left distance)
-Omega V to mouseY (top distance)
-Omega D1 to height-mouseY (bottom distance)
-Omega D2 to width-mouseY (right distance)

*/


char[] colors = {"A","B","C"};
int n=17;
char[][] colorMatrix= new char[n][n];
int sizeRect = 20;
int interval=3;
int space=6;
int Omega_H=50;int Omega_V=50;int Omega_D1=1;int Omega_D2=1;


 void setup() {
    size(400,400);
    noStroke();    
    frameRate(10);
   // background(255,255,255);
    background(0);
    }
   

   void draw() {

    iterate();
    drawMatrix();
    drawLabel();

  }
  
   void mousePressed() {
    resetMatrix();
    // map mouseX and mouseY to Omega values
    // Omega H to mouseX (left distance)
    Omega_H= (int) map(mouseX,0,width,1,50);
    // Omega V to mouseY (top distance)
    Omega_V= (int) map(mouseY,0,height,1,50);
    // Omega D1 to height-mouseY (bottom distance)
    Omega_D1= (int) map(height-mouseY,0,height,1,50);
    // Omega D2 to width-mouseY (right distance)
    Omega_D2= (int) map(width-mouseX,0,width,1,50);

    }

   void iterate() {

      // iterate all positions      
      for (int xpos=0;xpos<n; xpos++)
      for (int ypos=0;ypos<n;ypos++) {
      
      
    // calculate energy for each color for actual pos
    // and store index of less energy color
       double minEnergy = 0;
      double[] colorEnergy = new double[colors.length];
      
       for (int i=0;i<colors.length;i++){
         
         colorEnergy[i]=Energy(colors[i],xpos,ypos);

         if (i==0) minEnergy=colorEnergy[i];
         else if (colorEnergy[i] < minEnergy) minEnergy=colorEnergy[i];

        }
       
       // evaluate which colors have the minimal energy
    String colorsMinEnergy="";    
       for (int i=0;i<colors.length;i++){
          if (colorEnergy[i]==minEnergy) colorsMinEnergy=colorsMinEnergy + colors[i];
     
       }
       
       colorMatrix[xpos][ypos]=colorsMinEnergy.charAt((int) random(colorsMinEnergy.length()));
      
      }
  }
  
   double Energy (char ccolor, int xpos, int ypos) {
    // calculate 
    // energy of each color is determined by the number of cells 
    // with the same color in the neighborhood
    double energy=0;
    int P_H=0;int P_V=0;int P_D1=0;int P_D2=0;
    int c_H=0;int c_V=0;int c_D1=0;int c_D2=0;
    int T=0;
    boolean flag=true;
    
    int nPower=5;
    int x=xpos-1;
    int y=xpos-1;
    //D1_x_before
    while (flag && x>=0 && y>=0) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos-1 && y==ypos-1) P_D1++;
        c_D1++;
        x--;
        y--;
      }
      else flag=false;
    }
    //D1_x_after
    x=xpos+1;
    y=ypos+1;
        flag=true;

    while (flag && x<n && y<n) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos+1 && y==ypos+1) P_D1++;
        c_D1++;
        x++;
        y++;
      }
      else flag=false;
    }
    //D2_x_before
    x=xpos-1;
    y=ypos+1;
        flag=true;
    while (flag && x>=0 && y<n) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos-1 && y==ypos+1) P_D2++;
        c_D2++;
        x--;
        y++;
      }
      else flag=false;
    }
    //D2_x_after
    x=xpos+1;
    y=ypos-1;
        flag=true;
    while (flag && x<n && y>=0) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos+1 && y==ypos-1) P_D2++;
        c_D2++;
        x++;
        y--;
      }
      else flag=false;
    }
    //H_x_before
    x=xpos-1;
    y=ypos;
        flag=true;
    while (flag && x>=0) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos-1) P_H++;
        c_H++;
        x--;
      }
      else flag=false;
    }
    //H_x_after
    x=xpos+1;
        flag=true;
    while (flag && x<n) {
      if (colorMatrix[x][y]==ccolor) {
        if (x==xpos+1) P_H++;
        c_H++;
        x++;
      }
      else flag=false;
    }
    //V_y_before
    x=xpos;
    y=ypos-1;
        flag=true;
    while (flag && y>=0) {
      if (colorMatrix[x][y]==ccolor) {
        if (y==ypos-1) P_V++;
        c_V++;
        y--;
      }
      else flag=false;
    }
    //V_y_after
    y=ypos+1;
        flag=true;
    while (flag && y<n) {
      if (colorMatrix[x][y]==ccolor) {
        if (y==ypos+1) P_V++;
        c_V++;
        y++;
      }
      else flag=false;
    }
    
    T= P_D1+P_D2+P_H+P_V;
    
    energy=Omega_H*Math.pow(c_H, nPower)*(P_H+1)/(T+1)+
    Omega_V*Math.pow(c_V, nPower)*(P_V+1)/(T+1)+
    Omega_D1*Math.pow(c_D1, nPower)*(P_D1+1)/(T+1)+
    Omega_D2*Math.pow(c_D2, nPower)*(P_D2+1)/(T+1);
    
    return energy;
    }
   
    static int countOccurrences(String haystack, char needle)
   {
       int count = 0;
       for (int i=0; i < haystack.length(); i++)
       {
           if (haystack.charAt(i) == needle)
           {
                count++;
           }
       }
       return count;
   }

    void resetMatrix() {
     for (int i=0;i<n;i++)
        for (int j=0;j<n;j++)
        colorMatrix[i][j]="\u0000";
   }
   
    void drawMatrix() {
     for (int i=0;i<n;i++)
        for (int j=0;j<n;j++){
          if (colorMatrix[i][j]=="A") fill(color(0, 0, 205)); // middle blue
          if (colorMatrix[i][j]=="B") fill(color(255, 99, 71));// tomato
          if (colorMatrix[i][j]=="C") fill(color(255, 255, 0));// yellow
          rect(space+i*(sizeRect+interval),space+ j*(sizeRect+interval), sizeRect, sizeRect);
        }    
   }
   
    void drawLabel() {
     fill(150, 200);
     rect(0,height-20,width, 20 );
     fill(255);
     text("Omega H="+Omega_H+ "; Omega V="+Omega_V+ ";Omega D1="+Omega_D1+ ";Omega D2="+Omega_D2, 0, height-5);
     
   }
   



