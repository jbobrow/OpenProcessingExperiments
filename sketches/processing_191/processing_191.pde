
/*
this class stores the mtl information. 
I am assuming that only ambient, diffuse, specular and shininess values are specified.
ahmet.kizilay@gmail.com
*/
class MTLInfo{
   Vec3 ka;
   Vec3 kd;
   Vec3 ks;
   float ns; 
   String name;
   MTLInfo(){
     
   }
   
   void setAmbient(Vec3 am){
      ka = am.copy(); 
   }
  
   void setDiffuse(Vec3 dif){
      kd = dif.copy(); 
   }
   
   void setSpecular(Vec3 spec){
      ks = spec.copy(); 
   }
   
   void setShininess(float shine){
      ns = shine; 
   }
     
   void setName(String _name){
      name = _name; 
   }   
}

