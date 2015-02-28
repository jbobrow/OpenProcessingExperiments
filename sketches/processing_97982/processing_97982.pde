
// OBJECTS 

Snowflake mysnowflake1;
Snowflake mysnowflake2; 
Snowflake mysnowflake3; 

Snowflake mysnowflake4;
Snowflake mysnowflake5; 
Snowflake mysnowflake6;  // multiple OBJECTS



void setup() {
  size(300,350);
  smooth();
  mysnowflake1 = new Snowflake(color(135,168,192),0,20,2);    //tone 01  // PARAMETERS go inside the parentheses when the object is constructed.
  mysnowflake2 = new Snowflake(color(208,229,246),20,90,1);   //tone 02
  mysnowflake3 = new Snowflake(color(255)        ,50,200,2);   //white
  
  mysnowflake4 = new Snowflake(color(135,168,192),90,260,3);    //tone 01  
  mysnowflake5 = new Snowflake(color(208,229,246),120,300,1);   //tone 02
  mysnowflake6 = new Snowflake(color(255)        ,80,340,2);   //white
  

}

void draw() {
  translate(40, -10);
  background(141, 199, 236);   //sky blue)
  mysnowflake1.move();
  mysnowflake1.display();
  mysnowflake2.move();
  mysnowflake2.display();
  mysnowflake3.move();
  mysnowflake3.display();
  
  mysnowflake4.move();
  mysnowflake4.display();
  mysnowflake5.move();
  mysnowflake5.display();
  mysnowflake6.move();
  mysnowflake6.display();
}



