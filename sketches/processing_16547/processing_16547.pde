
class pointer
{
   pt pos;
   pt vertex1;
   pt vertex2;
   pt vertex3;
   float span = 10;
   vec direction;
   pointer(character origin, character destination, float distance)
   {
      vec temp;
      direction = U(origin.pos, P(destination.getX()+20, destination.getY()+20));
      pos = T(P(origin.getX()+20,origin.getY()+20), distance-1, P(destination.getX()+20,destination.getY()+20));
      vertex1 = T(P(origin.getX()+20,origin.getY()+20), distance+10, P(destination.getX()+20,destination.getY()+20));
      vertex2 = T(pos, 5, R(direction,90));
      vertex3 = T(pos, 5, R(direction,-90));
      noStroke();
      if(origin.info == 1)
      {
        fill(red,125);
      } 
      else if(origin.info == 2)
      {
        fill(blue,125);    
      }
      else if(origin.info == 3)
      {
        fill(yellow,125);
      }
      else if(origin.info == 4)
      {
        fill(green,125);
      }
      if(d(origin.pos, destination.pos) > distance*2-2)
      {
        triangle(vertex1.x, vertex1.y, vertex2.x, vertex2.y, vertex3.x, vertex3.y);
      }
     // println("person pos: "+people[where].getX() + " | "+pos.x);
   } 
}

