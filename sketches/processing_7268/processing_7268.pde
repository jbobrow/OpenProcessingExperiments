
/*
//stores and draws lines 
//Patchwork
*/
/*

    P_Debuglines()
      void show(PVector s, PVector e, color c)
      void render()

      class aline
         aline(PVector s, PVector e, color c)
   
   
*/
class P_Debuglines {
 
 ArrayList lines; 
 boolean debug;
 
 P_Debuglines(){
    lines = new ArrayList();
    debug = true;
 }

 void show(PVector s, PVector e, color c){
   aline l;
   
   if (!debug) return;
   
   for(int i = lines.size()-1 ; i >= 0; i--){
     l = (aline) lines.get(i);

//wait...
// && or ||  ???????????????????????????????????????

     //same line ?
     if((l.start.x == s.x && l.start.y == s.y) && (l.end.x == e.x && l.end.y == e.y)) return;

     //same line the other way ?
     if((l.start.x == e.x && l.start.y == e.y) && (l.end.x == s.x && l.end.y == s.y)) return;

   }
   lines.add(new aline(s.get(),e.get(),c));
 }
  
 void render(){
   aline l;
   
   if (!debug) return;
   //fill(0,0,0, 100); 
 
   for(int i = lines.size()-1 ; i >= 0; i--){
     l = (aline) lines.get(i);
     stroke(l.colour,40);
     line(l.start.x,l.start.y,l.end.x,l.end.y);
     lines.remove(i); //l = null?
   }  
 } 
  
 class aline{
   PVector start;
   PVector end;
   color colour;
   
   aline(PVector s, PVector e, color c){
     start = s.get();
     end = e.get();  
     colour = c;
   }
 }//class aline 
  
}//class debuglines

