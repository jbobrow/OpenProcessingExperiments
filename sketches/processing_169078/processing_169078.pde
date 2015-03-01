
PFont font;
float r =120;
float Y= 0;

void setup() {
  size(900, 900, P3D); 
  font = loadFont("Helvetica-32.vlw");
  textFont(font);
}

void draw() {  
  
  translate(width/2,height/2);
  
  rotateX(Y);
  Y+=0.01;
  
  
    background(0);

    String a = "ABCD";
    String b = "EFGH";
    String c = "IJKL";
    String d = "MNOP";

    fill(#E7E860);
    for (float z = -height/1.5; z < height/1.5; z +=50)
    {

      for ( float deg = 0; deg < 360; deg +=20)
      {
        float theta = radians(deg);
        float x = r * cos(theta);
        float y = r * sin(theta);
        int substrbegin = (int)random(0, a.length()-1);
        int substrend = (int)random(substrbegin+1, a.length());  
        if (abs(z)%4==0)
        text(a.substring(substrbegin, substrend), x, z, y);
        
        else if (abs(z)%4==1)
        text(b.substring(substrbegin, substrend), x, z, y);
        
        else if (abs(z)%4 ==2)
        text(c.substring(substrbegin, substrend), x, z, y);
        
        else if (abs(z)%4 ==3)
        text(d.substring(substrbegin, substrend), x, z, y);
      }
    }
    
  
}

