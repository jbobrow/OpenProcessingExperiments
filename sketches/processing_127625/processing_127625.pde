

    float rot;
    float rotaa;
    float rota;
    float rotb;
    float rotc;
    float movement = 1;        
    float boxsize = 60;
    float minboxsize =25;
    float a = 0.01;



    void setup()
    {
      size(640,360, P3D);
    }

    void draw()
    {
      background(128);
      translate(width/2, height/2);

      if (rot > 6.28)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
      }

      if (rot < 6.28)
      {
        rot+=a;
        rotaa=rot;
        rota-=a;
      }
      
      if (rot > 12.56)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
        rotb-=a;

      }
      if (rot > 18.84)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
        rotb+=a;

      }
      if (rot > 25.13)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
        rotb+=a;
        rotc+=a;

      }
      if (rot > 31.41)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
        rotb+=a;
        rotc-=a;

      }
      if (rot > 37.69)
      {
        rot+=a;
        rotaa=rot;
        rota+=a;
        rotb+=a;
        rotc-=a;
        movement +=0.001;

      }
      
      
 
//      rotateX(rot/2);
//      rotateY(rot);
      rotateZ(rot);
      if(mousePressed) 
      {
        a=-a;         
      }
      box(boxsize);   
      dragon(boxsize);
    }
 
    void dragon(float h) {          
    if (h > minboxsize)     
      {
        h *= 0.85/movement; 
        
        pushMatrix();        
        translate(h*2/3,0,0); 
        rotateZ(rotaa);
        rotateY(rotb);
        rotateX(rotc);
        box(h);    
        dragon(h);  
        popMatrix(); 
        
        pushMatrix(); 
        translate(-h*2/3,0,0); 
        rotateZ(rota);
        rotateY(rotb);
        rotateX(rotc);
        box(h);
        dragon(h);
        popMatrix();

      }
   }

