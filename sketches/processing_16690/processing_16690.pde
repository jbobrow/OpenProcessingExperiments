
//Basic IOS
//December 3rd 2010
//Owaun Scantlebury
String srcdrive = "";//"\\\\sclserver00\\internal\\misc\\scl_ios\\data\\";
boolean stat[];
String nowstatus = "OUT";
String company_name = "Processing";
String website = "www.processing.org";
String email = "owaunz@gmail.com"; 
String employee_current_workstations = "http://4.bp.blogspot.com/_YN3-mOToAD0/TQN_Ix9TGYI/AAAAAAAAANs/mX0bEAvLv_c/s1600/BSS_points.png";
//"http://2.bp.blogspot.com/_YN3-mOToAD0/TQPGQ7-ZI7I/AAAAAAAAAN0/2NGa0mhDDcs/s1600/interactivepixelarrayides.png";
//"http://4.bp.blogspot.com/_YN3-mOToAD0/TQN_Ix9TGYI/AAAAAAAAANs/mX0bEAvLv_c/s1600/BSS_points.png";
//srcdrive+"BSS_points.png";
public color [] workstations;
public color [] actual_station_points;
public PImage actual_station_points_img;
public String employees = srcdrive+"employees.txt"; //0
String[] employee_lines;
public String locations = srcdrive+"locations.txt"; //1
String[] location_lines;
public String parishes = srcdrive+"parishes.txt"; //2
String[] parish_lines;
public boolean place_randomly = false;
public color [] static_workstations=new color[8];
public int w=255;
public int h = 255;
public int gap = 25;
public String layers = srcdrive+"layers.png";
public String palette = srcdrive+"pallete.png";
public int [] wsz= new int [3];
public int [] hsz = new int[3];
public char [][] keyz0;
public char [][] keyz1;
public char [][] keyz2;
public String [] n_employees;
public String [] n_locations;
public String [] n_parishes;
void load_employees(){
  // employee_lines = loadStrings(employees);
  employee_lines = png_to_memory("http://2.bp.blogspot.com/_YN3-mOToAD0/TQPGQ7-ZI7I/AAAAAAAAAN0/2NGa0mhDDcs/s1600/interactivepixelarrayides",
  ".png");

  //"http://1.bp.blogspot.com/_YN3-mOToAD0/TQNmxo4xsUI/AAAAAAAAANk/2-vFF7hxa3M/s1600/employees",
  //                               ".png");

  wsz[0]=max(maxa(employee_lines));
  hsz[0]=employee_lines.length;
  //println(hsz[0]);
  n_employees=new String[hsz[0]];
  keyz0=new char[wsz[0]][hsz[0]];
  workstations = new color [hsz[0]];
  actual_station_points = new color [hsz[0]];
  for (int _h=0;_h<hsz[0];_h++){
    int kiv = employee_lines[_h].length();
    for (int _w=0;_w<kiv;_w++){
      keyz0[_w][_h]=employee_lines[_h].charAt(_w);

      if (_w>0) n_employees[_h]= n_employees[_h]+keyz0[_w][_h];
      if (_w==0)n_employees[_h]=""+keyz0[_w][_h];
      if(employee_lines[_h].charAt(_w) =='i'){
        // print('I');
      }
      else
      {
        //  print(lines[_h].charAt(_w));
      }
    } 
    if (place_randomly )workstations[_h]=color(random(w-gap),random(w-gap),random(w-gap));
    if ( !place_randomly )workstations[_h] =  static_workstations[_h];
    //static_workstations[_h];
    color c = static_workstations[_h];

    //println("Employee "+_h+" : "+cr(c)+" , "+cg(c)+ " , "+cb(c));

    //  println("Employee point "+_h+" >>  "+n_employees[_h]);
    //println("break");
  }
}

void load_parishes(){
  parish_lines = loadStrings(parishes);
  wsz[1]=max(maxa(parish_lines));
}

void load_locations(){
  location_lines = loadStrings(locations);
  wsz[2]=max(maxa(location_lines));
}


int [] maxa(String [] a)
{
  int retvalone,retvalnow =0;
  int [] retval= new int [a.length];
  for (int x=0;x<a.length;x++){
    retval[x]=a[x].length();

  } 
  return retval;
}


void place_employees(color [] station){
  for (int x=0;x<station.length;x++){
    int _x = cr(station[x]);
    int _y= cg(station[x]);
    // stroke(1);
    noStroke();
    fill(station[x]);
    ellipse(_x,_y,12,12);
    // stroke(1);
    //  point(_x,_y);

  }
}


void setup_static_workstation_colours(){
  // Employee    
  static_workstations[0]= color(127,127,127); //grey 
  static_workstations[1]= color(237,28,36) ;  //red
  static_workstations[2]= color(255,127,39); //orange
  static_workstations[3]= color(255,242,0); //yellow
  static_workstations[4]= color(114,121,216);
  //static_workstations[4]= color(34,177,76); // green
  static_workstations[5]= color(63,72,204) ; //blue
  static_workstations[6]= color(163,73,164); //purple
  static_workstations[7]= color(186,122,87); // browne


}
void get_actual_employee_points(){
  PImage retval = loadImage(employee_current_workstations);
  // image(retval,0,0);
  //  String [] ez_lines = loadStrings(employees);
  String [] ez_lines = png_to_memory("http://2.bp.blogspot.com/_YN3-mOToAD0/TQPGQ7-ZI7I/AAAAAAAAAN0/2NGa0mhDDcs/s1600/interactivepixelarrayides",
  ".png");
  color n = retval.pixels[0];
  int ww =max(maxa(ez_lines));
  int hh =ez_lines.length;
  actual_station_points = new color [hh];
  stat = new boolean [hh];
  actual_station_points_img=createImage(255,255,ARGB);
  actual_station_points_img.copy(retval,0,0,255,255,0,0,255,255);
  static_workstations[0]= color( 80 , 140 , 255);
  static_workstations[1]= color( 175 , 175 , 255);
  static_workstations[2]= color( 175 ,140  , 255);
  static_workstations[3]= color( 80 , 80 , 255);
  static_workstations[4]= color(  220,  45, 255);
  static_workstations[5]= color(  80,45  , 255);
  static_workstations[6]= color( 175 ,110  , 255);
  static_workstations[7]= color( 40 , 110 , 255); 
  // actual_station_points[8]= color(  35, 100 , 255);

}
void get_actual_employee_points2(){
  PImage retval = loadImage(employee_current_workstations);
  // image(retval,0,0);
  String [] ez_lines = loadStrings(employees);
  color n = retval.pixels[0];
  int ww =max(maxa(ez_lines));
  int hh =ez_lines.length;
  actual_station_points = new color [hh];
  actual_station_points_img=createImage(255,255,ARGB);
  actual_station_points_img.copy(retval,0,0,255,255,0,0,255,255);
  color k= 0;

  for (int x=0;x<255;x++){
    for (int y=0;y<255;y++){
      //  print("e"); 
      // for (int i=0;i<hh;i++){
      k = actual_station_points_img.get(x,y);
      if (k==n){
        for (int i=0;i<hh;i++){
          if (k==static_workstations[i] && brightness(k)>255/2) {

            actual_station_points [i]=color(x,y,255);
            //  println(  actual_station_points [i]);
          }
        }
      }
    }
  }


}
void setup(){
  //online = true; //uncomment for testing
  size(765,255);
  smooth();
  //println("loading employees");

  if (!place_randomly)  {
    setup_static_workstation_colours();
    get_actual_employee_points();

    image(   actual_station_points_img,0,0);
  }

  load_employees(); 
  if (workstations !=null) place_employees(workstations);
  //say(color(0,20,255), "Karl",6);
  loadPixels();
}
public color mc;
public String selectedemp;
void draw(){
  background(-1);
  if (!place_randomly)  {
    //  setup_static_workstation_colours();
    //    get_actual_employee_points();

    image(   actual_station_points_img,0,0);
  }
  if (workstations !=null) place_employees(workstations);

  for (int i =0;i< hsz[0];i++){
    mc = pixels[mouseX+width*mouseY];
    if (mc==  static_workstations[i]){
      // println( 
      selectedemp =  n_employees[i];
      selectedempindex =i;
      say(color(10,20,255), selectedemp,8);
    }
  }

  if (selectedemp !=null && stat[selectedempindex]){
    nowstatus = "IN";
    if (!online) this.frame.setTitle("Employee "+selectedemp + " - "+nowstatus);

  }
  if (selectedemp !=null && !stat[selectedempindex])
  {
    nowstatus = "OUT";
    if (!online) this.frame.setTitle("Employee "+selectedemp + " "+nowstatus);

  }
}

public int selectedempindex;

void mousePressed(){
  for (int i =0;i< hsz[0];i++){
    mc = pixels[mouseX+width*mouseY];
    if (mc==  static_workstations[i]){
      // println( 
      selectedemp =  n_employees[i];
      stat [i]=!stat[i];
      selectedempindex =i;
    }
  }

}

color cr(color colx){ 
  return  colx >> 16 & 0xff;
}
color cg(color colx) { 
  return  colx >> 8 & 0xff;
}
color cb(color colx){
  return    colx  & 0xff;
}
color ca(color colx){
  return   colx >> 24 & 0xff;
}


///


String [] png_to_memory (String src, String ext){
  PImage a = loadImage(src+ext);
  String form="";
  String [] retval = new String [a.height];
  char [][] keyz = new char[a.width][a.height];


  for (int _h=0;_h<a.height;_h++) {
    // int kiv = lines[_h].length();
    for (int _w=0;_w<a.width;_w++) {
      float put = cr(a.get(_w,_h));
      int puti = cr(a.get(_w,_h));
      keyz[_w][_h]=char(byte(put));

      if (int(char(byte(cr(a.get(_w,_h))))) !=204 && int(char(byte(cr(a.get(_w,_h))))) !=0 ) {


        if (_w==0)form=""+str(char(puti));
        if(_w>0)form=form+str(char(puti));

      }


      // check++;


    }
    if (form!=null && form.length()>0){
     if(!online) println(form);
      retval[_h]=form;
    }
  }  
 if(!online) println("--------OUTPUT FROM LINES ARRAY---");



 if(!online){
  for (int x=0;x<a.height;x++){
    println(retval[x]); 
  }
 }
  return retval;
}
//
//color cr(color colx){ 
//  return  colx >> 16 & 0xff;
//}
//color cg(color colx) { 
//  return  colx >> 8 & 0xff;
//}
//color cb(color colx){
//  return    colx  & 0xff;
//}


///



void putshape(String shapx,color location,int w,int h,color in,color out,int val){
  //println(shapx); 
  // char lo = saywhat.charAt(val);
  char shap = saywhat.charAt(val);

  //String shap=str(lo);
  //  String shap = ""+str();
  // println(shap);
  strokeWeight(1.3); 
  stroke(1);
  int x = cr(location)+1; 
  int y = cg(location); 
  if (shapx=="box"){ 
    rectMode(CENTER); 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    rect(x,y,w,h); 
  } 

  if (shapx=="circle"){ 
    ellipseMode(CENTER); 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 

    ellipse(x,y,w,h); 
  } 
  if(shapx=="triangle"){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 

    triangle(x-(w/2),y+(h/2),x,y-h/2,x+(w/2),y+(h/2)); 
  } 
  if(shapx=="x" ){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x-(w/2),y+(h/2)); 
  } 
  if (shap =='A' || shap =='a'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x,y-(h/2),x-(w/2),y+(h/2)); 
    line(x,y-(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/3),y+(h/4),x+(w/3),y+(h/4)); 




  } 
  if (shap=='B' || shap =='b'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 
  } 

  if (shap=='C' || shap =='c'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 

  } 

  if (shap=='D' || shap == 'd'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 
  } 
  if (shap=='E' || shap == 'e'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 

  } 
  if (shap=='F' || shap =='f'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 

    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 

  } 
  if (shap=='G' || shap =='g'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y,x+(w/2),y+(h/2)); 
  } 

  if (shap=='H' || shap =='h'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 

    line(x-(w/2),y,x+(w/2),y); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 

  } 

  if (shap=='I' || shap =='i'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x,y-(h/2),x,y+(h/2)); 

  } 
  if (shap=='J' || shap == 'j'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x,y+(h/2)); 
    line(x,y-(h/2),x,y+(h/2)); 
    line(x-(w/2),y+(h/2),x-(w/2),y); 
  } 

  if (shap=='k' || shap=='K'){ 
    //println(shap2);
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y,x+(w/2),y+(h/2)); 
    line(x-(w/2),y,x+(w/2),y-(h/2)); 

  } 
  if (shap=='L' || shap == 'l'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 

  } 

  if (shap=='M' || shap =='m'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x,y); 
    line(x+(w/2),y-(h/2),x,y); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 


  } 
  if (shap=='N' || shap == 'n'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x+(w/2),y); 

    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 


  } 

  if (shap=='O' || shap == 'o'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 

    line(x-(w/4),y-(h/4),x+(w/4),y-(h/4)); 

    line(x-(w/4),y+(h/4),x+(w/4),y+(h/4)); 
    line(x-(w/4),y-(h/4),x-(w/4),y+(h/4)); 
    line(x+(w/4),y-(h/4),x+(w/4),y+(h/4)); 
  } 

  if (shap=='P' || shap == 'p'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 


    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 
    line(x+(w/2),y-(h/2),x+(w/2),y); 

  } 


  if (shap=='Q' || shap == 'q'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 
    line(x+(w/2),y+(h/2),x,y); 
  } 

  if (shap=='R' || shap == 'r'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 


    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 
    line(x+(w/2),y-(h/2),x+(w/2),y); 
    line(x-(w/2),y,x+(w/2),y+(h/2)); 
  } 

  if (shap=='S' || shap == 's'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 
    line(x-(w/2),y,x+(w/2),y); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y); 
    line(x+(w/2),y+(h/2),x+(w/2),y); 
  } 

  if (shap=='T' || shap == 't'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    // line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x,y-(h/2),x,y+(h/2)); 

  } 

  if (shap=='U' || shap == 'u'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 


    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 
    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 


  } 


  if (shap=='V' || shap == 'v'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 


    line(x-(w/2),y-(h/2),x,y+(h/2)); 
    line(x+(w/2),y-(h/2),x,y+(h/2)); 


  } 
  if (shap=='W' || shap == 'w'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 


    line(x-(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y+(h/2),x,y+(h/4)); 

    line(x+(w/2),y-(h/2),x+(w/2),y+(h/2)); 
    line(x+(w/2),y+(h/2),x,y+(h/4)); 

  } 
  if (shap=='X' || shap == 'x'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 


    line(x-(w/2),y-(h/2),x+(w/2),y+(h/2)); 
    line(x+(w/2),y-(h/2),x-(w/2),y+(h/2)); 

  } 

  if (shap=='Y' || shap == 'y'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 


    line(x-(w/2),y-(h/2),x,y); 
    line(x+(w/2),y-(h/2),x,y); 
    line(x,y,x,y+(h/2)); 
  } 


  if (shap =='Z' || shap == 'z'){ 
    if (out!=0)stroke(out); 
    if (out==0)noStroke(); 
    if (in==0)noFill(); 
    if (in!=0)fill(in); 
    line(x-(w/2),y-(h/2),x+(w/2),y-(h/2)); 

    line(x+(w/2),y-(h/2),x-(w/2),y+(h/2)); 
    line(x-(w/2),y+(h/2),x+(w/2),y+(h/2)); 




  } 
}



///



public String saywhat;
void say(color at, String what,int spacing){
  saywhat= what ;
  int whatlength =what.length();
  //print(whatlength);
  int _x = cr(at)+1;
  int _y = cr(at)+2;
  int check = 0;
  String which_letter = "";
  color letter_location = 0;
  for (int x=_x;x<_x+(whatlength*spacing);x+=spacing){
    if(check<whatlength) which_letter = ""+what.charAt(check);
    letter_location = color((x+(spacing*check))+2,_y+2,255);
    // print(" "+which_letter);
    // print(" "+_x );
    // putshape(String shap,color location,int w,int h,color in,color out){ 
    putshape(which_letter,letter_location,spacing,spacing,color(233,23,23),color(233,23,23),check); 
    check++;

  }
  check=0;
  saywhat = "";
  saywhat = nowstatus;
  int dd= 170;
  int statuslength =  nowstatus.length();
  for (int x=(dd+_x+(whatlength*spacing));x<(dd+_x+(whatlength*spacing))+statuslength ;x+=spacing){
    letter_location = color((x+(spacing*check))+1,_y-8,255);
    putshape(which_letter,letter_location,spacing,spacing,color(233,23,23),color(233,23,23),check); 
    check++;
  }

}






