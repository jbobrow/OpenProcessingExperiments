
/* 11/13/14
*  Funky triangle pattern!
*   by: Jennifer Bermeo
*       and Misha Holtz
*/

void setup(){
 size(400, 400);
 noStroke();
 smooth(); 
 frameRate(5); //slows the frame rate by 5
}

void draw(){
  for (int y = 0; y < 401; y+=20) //fills each y row
  {
   triangleRow(y);  //calls the triangle funcion for each yCoor
  }
}

void triangleRow (int yCoor) {
  
  for (int i = 0; i < 401; i += 20)//fills each x triangle in a row
  {
  fill(random(255), random(255), random(255)); //random fill color
  triangle(i-10, yCoor+20, i, yCoor+0, i+10, yCoor+20); //upward triangles
  fill(random(255), random(255), random(255)); //random fill color
  triangle(i, yCoor+0, i+10, yCoor+20, i+20, yCoor+ 0); //downward triangles
  
  }
  
}



