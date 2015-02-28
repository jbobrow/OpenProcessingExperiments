
      /*
// Übung 3.1.1 (WHILE)
size (220,220);

float x = 40;
float space = 20;

while ( x <= 180 ){
  line (x,40,x,180);
  x = x + space;
}
      */


      /*
// Übung 3.1.2 (WHILE)
size (220,220);

float y = 40;
float space = 20;

while ( y <= 180 ){
  line (40,y,180,y);
  y = y + space;

}
      */


      /*
// Übung 3.1.3 (WHILE)
size (220,220);

float xoben = 80;
float x = 40;
float space = 20;

while ( x <= 180 ){
  line (xoben,40,x,180);
  x = x + space;
  xoben = xoben + space;
}
        */
        

        /*
// Übung 3.1.4 (WHILE)
size (220,220);

float ylinks = 80;
float y = 40;
float space = 20;

while ( y <= 180 ){
  line (40,ylinks,180,y);
  y = y + space;
  ylinks = ylinks + space;

}      
          */
 
 
 
          
          /*
// Übung 3.1.5 (FOR)          
size (220,220);


float space = 1;

for ( float x = 40; x <= 180; x = x + space ){
  line (x,40,x,180);
  space = space * 1.5;
}          
          */
          
  
  
          
          /*
// Übung 3.1.6 (FOR)  
size (220,220);


float space = 1;

for ( float y = 40; y <= 180; y = y + space ){
  line (40,y,180,y);
  space = space * 1.5;
}  
          */
          



           /*
// Übung 3.1.7 (FOR)          
size (220,220);


float space =20;

for ( float x = 40; x <= 110; x = x + space ){
  line (x,40,x,110);
  
}               

float space2 =20;

for ( float x = 110; x <= 180; x = x + space ){
  line (x,110,x,180);
  
}          
          */
          
          
          
// Übung 3.1.8 (FOR) 
size (220,220);


float space = 20;

for ( float y = 40; y <= 180; y = y + space ){
  line (40,y,110,y);
 
} 



float space2 = 20;

for ( float y = 50; y <= 180; y = y + space ){
  line (110,y,180,y);
 
} 


  saveFrame("line.png");
        













