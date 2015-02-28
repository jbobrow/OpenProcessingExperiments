
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PrintWriter lastData;
BufferedReader reader;
String line;

int a,m,d;

PImage img;

Minim minim;
FFT fft;
AudioInput in;

Minim minim2;
AudioPlayer in2;

Minim minim3;
AudioPlayer in3;

int fftSize;
float armonic;
float under15;
float over15;
float bell;
float nobell;

int rings;

boolean init;
boolean pintando;
boolean delet;

//Ciclo de refresco. Inica el numero de ciclos del bulcedraw() que deben ejecutarse para incrementar 
//en una unidad el valor de opacidad del pixel activo y que la imagen desaparezca compleamente en el plazo de un mes. Por defecto 45
int ciclos = 1;
int nc = 0;
int cubosDia = 93;

ArrayList <Pixel> pixeles;
int countP;
ArrayList <Pixel> pixelesLimbo;
int countPL;
int aux;

void setup()
{ 
  size(700,394);
  frameRate(12);
  
  init = true;
  pintando = false;
  delet = false;
  
  img = loadImage("frame.jpg");
  
  //variables para los ArrayList
  countP=0;
  countPL=0;
  
  pixeles = new ArrayList (2800);
  pixelesLimbo = new ArrayList(2800);
  for (int y=0; y <40; y++)
  {
    for (int x=0; x <70; x++)
    {
      pixelesLimbo.add(new Pixel(x,y));
      countPL++;
    }
  }
  
  //Mic init
  fftSize = 512;
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO,fftSize*2);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  
  over15 = 0;
  under15 = 0;
  bell = 0;
  nobell = 0;
  
  minim2 = new Minim(this);
  in2 = minim2.loadFile("../pista1.mp3");
  
  minim3 = new Minim(this);
  in3 = minim3.loadFile("../street.mp3");
}
void draw()
{
  if(init){init=false; actualiza();}
  
  background(255);
  image(img, 0, 0);
  
  if(pintando) //Parte en la que se pinta el pixel y no se añade
  {
    nc ++;
      
    if(nc==ciclos && countPL > 0)
    {
       // println("entro");
       nc=0;
       if(pixeles.get(countP-1).getOpa() == 255)
       {
         //El pixel esta pintado. Salimos de esta estructura de control modificando la booleana de estado y se procede a alojar un nuevo pixel del limbo.
         pintando = false;
       }
       else
       {
         pixeles.get(countP-1).incOpa();
       }
     }
  }
  else // Cuando se acaba de pintar
  {
      if(!delet)//si no estamos quitando se añade un pixel del limbo al mosaico
      {
          
          aux=(int)random(0,countPL-1);
          pixeles.add(pixelesLimbo.get(aux));
          countP++;
          //println(pixelesLimbo.get(aux).toString());
          pixelesLimbo.remove(aux);
          countPL--;
          //println(pixelesLimbo.get(aux).toString());
          
          pintando=true;
      }
      else
      {
         int aux = 0;
         if(countP > 150){aux= (int)random(151,countP);}else{aux=countP;}
         for (int i=0; i< aux ;i++)
         {
            pixeles.get(countP-1).zeroOpa();
            pixelesLimbo.add(pixeles.get(countP-1));
            
            pixeles.remove(countP-1);
            countP--;
            countPL++;
              
         }//fin del for de borrado aleatorio
               
         lastData = createWriter("lastData.txt");
         lastData.print(day()+" "+month()+" "+year());
         lastData.flush(); // Writes the remaining data to the file
         lastData.close();
                
         if(countP == 0)   
          {in2.rewind();in2.play();}
          
          delet = false;
      }
    }
  println("countP" + countP);
  println("countPL" + countPL);
  
  //Pintamos todos los pixeles
  
  for (int i = 0; i < countP ; i++)
  {
    pixeles.get(i).pinta();
    //println("size " + pixeles.size());
    //println("x"+ pixeles.get(i).posx+"y"+ pixeles.get(i).posy);
  }
  
  
  
  
  //Audio Detection code
  fft.forward(in.right);

  //println("--------------------------");
  for(int i = 0 ; i < 64; i++)
  {
    fill(0,0,0);
    
    armonic = fft.getBand(i);
    if(i<15){under15=under15+armonic;}
    else{over15=over15+armonic;}
    
    if(i>10)
    {
      switch(i)
      {
        case 15:{bell = bell + armonic;}break;
        case 29:{bell = bell + armonic;}break;
        case 31:{bell = bell + armonic;}break;
        case 32:{bell = bell + armonic;}break;
        case 33:{bell = bell + armonic;}break;
        case 43:{bell = bell + armonic;}break;
        case 44:{bell = bell + armonic;}break;
        case 53:{bell = bell + armonic;}break;
        default: {nobell = nobell + armonic;}
      }
    }
  }
  
  if((over15-under15) < -20.0)
  {
    //println("voz humana");
  }
  else
  {
    //println("---------------------");
    if(bell > 18.0)
    {
      
      println("campana");
      delet=true;
      pintando = false;
    }
  }
  
  over15 = 0;
  under15 = 0;
  bell = 0;
  nobell = 0;
  //En mic detect code
}

//Declaracion de la clase pixel
class Pixel
{
  public int posx, posy;
  public int opacidad;
  
  public Pixel(int x, int y){
    posx = x*10;
    posy = y*10;
    opacidad = 0;
  }
  void pinta()
  {
    fill(0,0,0,opacidad);
    rect(posx,posy,10,10);
  }
  
  void incOpa()
  {
    opacidad+=17;
    
  }
  void zeroOpa()
  {
    opacidad = 0;
    
  }
  int getOpa()
  {
    return opacidad;
  }
  
  boolean equals (Pixel p)
  {
    if(this.posx== p.posx && this.posy==p.posy)
    {return true;}
    else
    {return false;}
  
  }
  String toString()
  {
    return ("Pixel en la posicion x "+posx+ " y en la posicion y " + posy);
  }
}

//Evento de salida. Actualizamos todas la posiciones.
void actualiza()
{
  reader = createReader("lastData.txt");
  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Stop reading because of an error or file is empty
    noLoop();  
  } else {
    String[] pieces = split(line, ' ');
    d = int(pieces[0]);
    m = int(pieces[1]);
    a = int(pieces[2]);
  }
  int tdias = 0;
  int tdiaso = 0;
  switch(month())
  {
    case 1:{tdias = day();}break;
    case 2:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ day();}else{tdias = 31 + day();}}break;
    case 3:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+day();}else{tdias = 31 + 28+day();}}break;
    case 4:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+day();}else{tdias = 31 + 28+31+day();}}break;
    case 5:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+30+day();}else{tdias = 31 + 28+31+30+day();}}break;
    case 6:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+30+31+day();}else{tdias = 31 + 28+31+30+31+day();}}break;
    case 7:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+30+31+30+day();}else{tdias = 31 + 28+31+30+31+30+day();}}break;
    case 8:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+30+31+30+31+day();}else{tdias = 31 + 28+31+30+31+30+31+day();}}break;
    case 9:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+ 29+31+30+31+30+31+31+day();}else{tdias = 31 + 28+31+30+31+30+31+31+day();}}break;
    case 10:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+29+31+30+31+30+31+31+30+day();}else{tdias = 31 + 28+31+30+31+30+31+31+30+day();}}break;
    case 11:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+29+31+30+31+30+31+31+30+31+day();}else{tdias = 31 + 28+31+30+31+30+31+31+30+31+day();}}break;
    case 12:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdias = 31+29+31+30+31+30+31+31+30+31+30+day();}else{tdias = 31 + 28+31+30+31+30+31+31+30+31+30+day();}}break;
  }
  switch(m)
  {
    case 1:{tdiaso = d;}break;
    case 2:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ d;}else{tdiaso = 31 + d;}}break;
    case 3:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+d;}else{tdiaso = 31 + 28+d;}}break;
    case 4:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+d;}else{tdiaso = 31 + 28+31+d;}}break;
    case 5:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+30+d;}else{tdiaso = 31 + 28+31+30+d;}}break;
    case 6:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+30+31+d;}else{tdiaso = 31 + 28+31+30+31+d;}}break;
    case 7:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+30+31+30+d;}else{tdiaso = 31 + 28+31+30+31+30+d;}}break;
    case 8:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+30+31+30+31+d;}else{tdiaso = 31 + 28+31+30+31+30+31+d;}}break;
    case 9:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+ 29+31+30+31+30+31+31+d;}else{tdiaso = 31 + 28+31+30+31+30+31+31+d;}}break;
    case 10:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+29+31+30+31+30+31+31+30+d;}else{tdiaso = 31 + 28+31+30+31+30+31+31+30+d;}}break;
    case 11:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+29+31+30+31+30+31+31+30+31+d;}else{tdiaso = 31 + 28+31+30+31+30+31+31+30+31+d;}}break;
    case 12:{if((a%4==0&&a%100!=0)||(a%400==0) ){tdiaso = 31+29+31+30+31+30+31+31+30+31+30+d;}else{tdiaso = 31 + 28+31+30+31+30+31+31+30+31+30+d;}}break;
  }
  int res = (tdias-tdiaso)*cubosDia;
  println("tdias "+ res);
  
  for(int i=0; i < res ; i++)
  {
    aux=(int)random(0,countPL-1);
    
    pixeles.add(pixelesLimbo.get(aux));
    countP++;
    //println(pixelesLimbo.get(aux).toString());
    pixelesLimbo.remove(aux);
    countPL--;
    //println(pixelesLimbo.get(aux).toString());
    
    pixeles.get(i).opacidad=255;
  }
}


