
/*H//A hashgrid class
//uk
The purpose of this sketch was to research onto spatial hashing, a technique that allows to optimize collision detection.
In order to get this, we create a grid of 'buckets' and we store the position of the particles in them. Thus when we want to check
the distances, we don't use the entire group, only the particles stored in the buckets nearest to the current particle.
I've based my class on and good ol' sketch of Flux: (http://users.design.ucla.edu/~mflux/p5/hashcollision2/applet/). 
I only have updated deprecated classes (LinkedList and HashMap instead of Vector and HashTag) and simplified some methods.
Without this technique 10,000 particles need 10 million of distance checks every frame, with it we only need 200,000.
Amazingly simple and efficient!
//es
Para optimizar el cálculo he empleado la técnica de 'spatial hashing', que busca la reducción del número de iteraciones
en el cálculo de colisiones. Tras probar varios maneras de ponerla en marcha me he quedado con ésta, que me parece de lejos
la manera más elegante para un caso sencillo y para la que he tomado como base la implementación que emplea Flux aquí: 
(http://users.design.ucla.edu/~mflux/p5/hashcollision2/applet/). 
Lo que he hecho ha sido actualizar el código, empleando las clases LinkedList y HashMap
en vez de Vector y HashTag (obsoletas) y clarificando algunos pasos que eran un poco barrocos a mi entender.
Con 10000 particulas pasamos de 10 millones de comprobaciones por frame a poco más de 200,000 (con una distancia de comprobación
del 10 al 20% de las dimensiones de tablero).
*/

class H {          
HashMap hM;
float tamCelda;

  //Constructor
  H (float tamCelda){this.tamCelda=tamCelda;hM=new HashMap();}

  int getXr (PVector pos) {                     //Given a location give me the horizontal position of the bucket that contains it
    return int(floor(pos.x/tamCelda));    
  }
  
  int getYr (PVector pos) {                     //...
    return int(floor(pos.y/tamCelda));
  }
  
  String getKey (PVector pos){                  //we'll make a string with the bucket position and that'll be our lookout key
    if(pos==null) {                             //i.e.: if we are in the bucket (23,48) --- the key will be 2348
      return "";
    }else{
      return str(getXr(pos))+str(getYr(pos));
    }
  }
  
  void clear(){                                     //clear data in the hashmap
    hM.clear(); 
  }
  
  void update(PVector pos){                         //UPDATE METHOD
     if (pos==null){
       return;
     }else{
       String hkey=getKey(pos);                     //check the key for the particle  
       if (hM.get(hkey)==null){                     //if the key doesn't exist create the container related to it
         LinkedList vl=new LinkedList();            //I used LinkedList cause I don't need here any random access to data. If you need so, use ArrayList instead!
         vl.add(pos);                               //add position to the container
         hM.put(hkey,vl);                           //put container into the hashmap
       }else{
         LinkedList vl= (LinkedList) hM.get(hkey);  //if key exists, retrieve the container 
         vl.add(pos);                               //and put the position inside
       }
     }
  }
  
  LinkedList check(PVector pos,int sight){          //CHECK METHOD 
    if (pos==null){
      return null; 
    }else{
      int Xr=getXr(pos);                            //As usual, we check the key related to current particle
      int Yr=getYr(pos);
      //Sight represents the 'far-sight' of the particle, because maybe we need particles that 'see' further than others 
      //I.e.: if sight is one, you'll check all buckets that are one bucket far from the current one, including it (9) | two: 25 | etc.
      int checkArea=int(pow((sight*2+1),2)); //total number of buckets      
      String[] keys=new String[checkArea];   //group of keys in the area
      int in=0;
      for (int xr=Xr-sight;xr<=Xr+sight;xr++){    //we'll walk trough the check area taking all keys, existent or not. 
        for (int yr=Yr-sight;yr<=Yr+sight;yr++){
          PVector c=new PVector(xr,yr);
          keys[in++]=str(xr)+str(yr);
        }
      }
      LinkedList checked= new LinkedList();
      for (int i=0;i<keys.length;i++){     
        if(hM.get(keys[i])!=null){                    //if key exists (if it's inside the game-board) 
        checked.addAll((LinkedList)hM.get(keys[i]));  //check all positions and add them to the list we want
        }
      }  
      return checked;
    }
  }

}


