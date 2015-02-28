
size(192,157);
background (#000000);
{
  //cabeza
  fill (#000000);
  strokeWeight(4); 
  stroke (#ffffff);
  smooth();
 ellipseMode (CENTER);
 ellipse (110,50,20,20);
     //trasero
  ellipse (96,109,20,20);
    //cuerpo
  strokeWeight(3); 
  rect (92,64,50,8);
        //piernas
     triangle (114,64,104,110,134,126);
  
  quad(90,110,94,68,106,68,110,110);
  rect (92,70,50,8);  
}
                
                
