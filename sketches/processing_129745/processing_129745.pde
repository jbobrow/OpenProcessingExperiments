
boolean[] fase = {false,false,false,false,false,
                  false,false,false,false,false,
                  false,false,false,false,false,
                  false,false,false,false,false,
                  false,false,false,false,false,
                  false,false,false,false,false,};
int LIMITE = 8;
char[] dato=new char[LIMITE];
String palabra;
int i=0;
String s1 ="Es viernes, hace un día fantástico,  decides irte a la montaña con unos amigos, así que llamas a us compañeros de curso y os vais a un monte que os avían comentado que tenía unas vistas preciosas, con lo que sin pensarlo más cogéis las mochilas y vais allí en busca de la aventura. Cuando llegáis allí hacéis una ruta por el bosque y como se hace de noche, buscáis un claro para plantar las tiendas y dormir. … (escribe sigue!!!)"; 
String s2 ="Te despiertas, tu compañero sigue durmiendo, es de noche, sientes que hay alguien/algo merodeando por fuera, y te preguntas que podrá ser. Escuchas el ruido de una tela al romperse y alguien grita… Que decides hacer?  A) Salir de allí inmediatamente. (escribe salir!!!) B) Ir a ver qué ha pasado allí afuera. (escribe mirar!!!)  C) Permanecer en la tienda.(escribe quedarme)";
String s3 ="Abres la tienda con cuidado, y observas algo saliendo corriendo hacia el sur, decides salir de allí, así que despiertas a tu compañero y le cuentas lo ocurrido.  Los dos sobresaltados os preparáis para salir inmediatamente de allí. … Abrís la tienda y sin pararos a mirar comenzáis a correr hacia el bosque. (Fin.. por ahora)";
String s4 ="Abres la tienda con cuidado, y observas algo saliendo corriendo hacia el sur, despiertas a tu compañero y le cuentas lo ocurrido… Al salir de la tienda observáis que hay manchas de sangre en la tienda de vuestros amigos, y descubrís que uno de los dos yace en el suelo, sangrando, pero cuando os intentáis acercar a el descubrís que está muerto, las manchas de sangre salen de la tienda y van en la misma dirección que la sombra que viste. (Fin.. por ahora)";
String s5 ="Estas tan asustado que prefieres quedarte en el interior de la tienda arropado por tu saco de dormir, te sientes cobarde, pero te escondes en la tranquilidad de la oscuridad y te quedas dormido, ajeno a lo que ocurre fuera… (Fin.. por ahora).";


void setup(){
  size(400,400);
       fill(0);
}
void draw(){  
 background(255);
rect(20,20,60,60);
text("que decides hacer?",90,40);   
   if(fase[0]==true){
      text(palabra, 90, 60);}
      println(palabra);
   if(fase[1]==true){
      text(s1, 20, 100, 360, 270);
}  if(fase[2]==true){
      text(s2, 20, 100, 360, 270);
}  if(fase[3]==true){
      text(s3, 20, 100, 360, 270);
}  if(fase[4]==true){
      text(s4, 20, 100, 360, 270);
}  if(fase[5]==true){
      text(s5, 20, 100, 360, 270);
}}
void keyPressed(){  
      
    if(key!=CODED && i < LIMITE){
        fase[0]=true;
        
        dato[i]=key;
        i++;
        
     }if(keyCode == DELETE&& i >= 1){
       i--;
       dato[i]='\0';
         if(i>0){
         i--;
         }
      }
      if(key==ENTER&&palabra.equals("c,o,n,t,i,n,u,a")){
         fase[1]=true;
      }
      if(key==ENTER&&palabra.equals("s,i,g,u,e,!,!,!")){
        fase[1]=false;
        fase[2]=true;
      }
      if(key==ENTER&&palabra.equals("s,a,l,i,r,!,!,!")){
        fase[2]=false;
        fase[3]=true;
      }
      if(key==ENTER&&palabra.equals("m,i,r,a,r,!,!,!")){
        fase[2]=false;
        fase[4]=true;
      }
      if(key==ENTER&&palabra.equals("q,u,e,d,a,r,m,e")){
        fase[2]=false;
        fase[5]=true;
      }
     
     palabra = new String(dato);
}



