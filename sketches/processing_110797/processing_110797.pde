

ArrayList<Point> points;

void setup(){

  size(800,600);
  points = new ArrayList<Point>();
}

int sqSize = 15;
boolean first = true;

void draw(){

}

void mousePressed(){
  if ( first ){
    
    background(208);
    fill(255);
    rect( mouseX - sqSize / 2, mouseY - sqSize/2, sqSize, sqSize);
    //firstX = mouseX;
    //firstY = mouseY;
    first = false;
    
    points.add(new Point( iX(mouseX), iY(mouseY)));
  }
  else{
    if ( mouseX > iX(points.get(0).x) - sqSize/2 && mouseX < iX(points.get(0).x) + sqSize/2 && 
          mouseY > iY(points.get(0).y) - sqSize/2 && mouseY < iY(points.get(0).y) + sqSize/2)
    {
        background(208);

      Point[] pArray = points.toArray( new Point[ points.size() ] );
      Triangulo[] tr = new Triangulo[ points.size() - 2];
      triangula( pArray, tr);
      
      for (int j=0; j<tr.length; j++)
      {  
         fill(random(256), random(256), random(256));
         triangle(iX(tr[j].a.x), iY(tr[j].a.y), iX(tr[j].b.x), iY(tr[j].b.y), iX(tr[j].c.x), iY(tr[j].c.y));
      }

      
      first = true;
      points.clear();
    }
    else{
      line( iX(points.get(points.size() -1 ).x), iY(points.get(points.size() -1 ).y), mouseX, mouseY);
      points.add(new Point( iX(mouseX), iY(mouseY)));
    }
  }
}

void triangula(Point[] p, Triangulo[] tr)
   {  
      // p contains all n polygon vertices in CCW order.
      // The resulting triangles will be stored in array tr.
      // This array tr must have length n - 2.
      int n = p.length, j = n - 1, iA=0, iB, iC;
      int[] next = new int[n];
      for (int i=0; i<n; i++)
      {  
         next[j] = i;
         j = i;
      }
      for (int k=0; k<n-2; k++)
      {  // Find a suitable triangle, consisting of two edges
         // and an internal diagonal:
         Point a, b, c;
         boolean triaFound = false;
         int count = 0;
         while (!triaFound && ++count < n)
         {  iB = next[iA]; iC = next[iB];
            a = p[iA]; b = p[iB]; c = p[iC];
            if (area2(a, b, c) >= 0)
            {  // Edges AB and BC; diagonal AC.
               // Test to see if no other polygon vertex
               // lies within triangle ABC:
               j = next[iC];
               while (j != iA && !adentroTriangulo(a, b, c, p[j]))
                  j = next[j];
               if (j == iA)
               {  // Triangle ABC contains no other vertex:
                  tr[k] = new Triangulo(a, b, c);
                  next[iA] = iC;
                  triaFound = true;
               }
            }
            iA = next[iA];
         }
         if (count == n)
         {  println("Not a simple polygon" +
              " or vertex sequence not counter-clockwise.");
         }
      }
   }




class Point{
 
 float x;
 float y;
 
 Point(float x, float y){
    this.x = x;
    this.y = y; 
 }
 
}

float area2(Point a, Point b, Point c){  
  return (a.x - c.x) * (b.y - c.y) - (a.y - c.y) * (b.x - c.x);
}


boolean ccw(Point[] p)
{  
   int n = p.length,k=0;
   for (int i=1; i<n; i++){
      if (p[i].x <= p[k].x && (p[i].x < p[k].x || p[i].y < p[k].y)){
         k=i;
      }
   }
   // p[k] is a convex vertex.
   int prev = k - 1, next = k + 1;
   if (prev == -1) prev = n - 1;
   if (next == n) next = 0;
   //return true;
   return area2(p[prev], p[k], p[next]) > 0;
}

boolean convex(Point[] p)
{
   int n = p.length;
   int prev = n - 1, next = 1;
   int pos =0, neg = 0;
   
   for (int i=0; i<n; i++){
     
     float pCruz = area2(p[prev], p[i], p[next]);
     
     if ( pCruz >= 0 )
       pos++; 
     else 
       neg++;
     
     if (++prev == n) prev = 0;
     if (++next == n) next = 0;
     
   }
   
   return (pos == 0 || neg == 0); 
}

float iX(float x){
  return x;
}

float iY(float y){
  return height - y; 
}

float area(Point[] pol)
{  
   int n = pol.length,
       j = n - 1;
   float a = 0;

   for (int i=0; i<n; i++)
   {  
      a += pol[j].x * pol[i].y - pol[j].y * pol[i].x; 
      j=i;
   }
   return a;
}




boolean adentroTriangulo(Point a, Point b, Point c, Point p) 
{ 
  int pos=0, neg=0, bla=0;
  bla = area2(a, b, p) >= 0 ? pos++ : neg++;
  bla = area2(b, c, p) >= 0 ? pos++ : neg++;
  bla = area2(c, a, p) >= 0 ? pos++ : neg++;
  return (pos == 0 || neg == 0);
}

class Triangulo
{
  
  Point a,b,c;
  
  Triangulo(Point a, Point b, Point c){
    this.a = a;
    this.b = b;
    this.c = c;
  }
}



