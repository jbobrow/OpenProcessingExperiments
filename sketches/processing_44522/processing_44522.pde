
PImage CO; //for the image background

void setup(){
  size(600,600);
  smooth();
   CO = loadImage ("CO.jpg");
}

void draw(){
  
  mapVis(); // use of void mapVis()
}

void mapVis(){
  image(CO,0,0,600,600); //calls the PImage

String[] data = loadStrings("SnowDATA.tsv"); //in this file is all the snow data
    for(int i = 0; i <data.length; i++){
      String[] pieces = split(data[i],TAB);
      float x = parseFloat(pieces[14]);
      float y = parseFloat(pieces[13]);
      float a = (x*4);
      float b = ((y*2)+20);
      
      //changes pieces into useable varibles
       float q = parseFloat((pieces[1])+10);
       float w = parseFloat((pieces[2])+10);
       float e = parseFloat((pieces[3])+10);
       float r = parseFloat((pieces[4])+10);
       float t = parseFloat((pieces[5])+10);
       float s = parseFloat((pieces[6])+10);
       float d = parseFloat((pieces[7])+10);
       float f = parseFloat((pieces[8])+10);
       float g = parseFloat((pieces[9])+10);
       float h = parseFloat((pieces[10])+10);
       float j = parseFloat((pieces[11])+10);
       float k = parseFloat((pieces[12])+10);
      
      //mouseover to show numbers for monthly snow data
      if(mouseX > (a-2) && mouseX < (a+120) && mouseY > (b-10) && mouseY < (b+3) ){ //MOUSE INTERACTIOn
      rect(15,260,575,60);
      line(95,260,95,300);
      line(15,275,575,275);
      fill(0);
      text("Year",50,290);
      text("Jul",100,290);
      text("Aug",140,290);
      text("Sep",180,290);
      text("Oct",220,290);
      text("Nov",260,290);
      text("Dec",300,290);
      text("Jan",340,290);
      text("Feb",380,290);
      text("Mar",420,290);
      text("Apr",460,290);
      text("May",500,290);
      text("Jun",540,290);

      //monthlySnowDATA
      text(pieces[0],20,272);
      text(pieces[1],100,272);
      text(pieces[2],140,272);
      text(pieces[3],180,272);
      text(pieces[4],220,272);
      text(pieces[5],260,272);
      text(pieces[6],300,272);
      text(pieces[7],340,272);
      text(pieces[8],380,272);
      text(pieces[9],420,272);
      text(pieces[10],460,272);
      text(pieces[11],500,272);
      text(pieces[12],540,272);
      
      //circles for monthly data
      fill(0,25);
      ellipse(100,300,q,q);
      ellipse(140,300,w,w);
      ellipse(180,300,e,e);
      ellipse(220,300,r,r);
      ellipse(260,300,t,t);
      ellipse(300,300,s,s);
      ellipse(340,300,d,d);
      ellipse(380,300,f,f);
      ellipse(420,300,g,g);
      ellipse(460,300,h,h);
      ellipse(500,300,j,j);
      ellipse(540,300,k,k);
      
      fill(random(255),random(255),random(255)); // allows the user to see which year they have moused over
       
       
     }
         else {
          fill(0,y*2.5);
        } 
    
    
    // println(pieces[14]+ " " +pieces[0]+ " " +pieces[1]+ " " +pieces[2]+ " " +pieces[3]+ " " +pieces[4]+ " " +pieces[5]+ " " +pieces[6]+" " +pieces[7]+ " " +pieces[8]+ " " +pieces[9]+ " " +pieces[10]+ " "+pieces[11]+ " " +pieces[12]+ " " +pieces[13]);
      
      text (pieces[0], x*4, ((y*2)+20));
   
   stroke(random(39,50),201,random(39,190));
   //below this is the bar graph
   line(0,540,600,540);
   line(10,0,10,600);
   rect((x*4.4)+5,530,10,-y*2);
   //here down is the credits pretty much
    stroke(0);
  quad(0, 600,
        0, 525, 
        314, 540,  
        350, 600);
 // line(0, 15,345, 600);
 // line(0, 485,600, 600);
  fill(255);
  text("Colorado's Monthly Snowfall", 15, 560);
  text("1882 till 2011", 15, 575);
 
  fill(100);
   text("http://www.crh.noaa.gov/bou/?n=denver_snowfall", 10, 596);
   fill(255);
}
//dot GRID probably will comment out, but useful for coding
 /*for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=50){
      noFill();

   line(y,x,y,x);
     stroke(0);
   line(x,y,x,y);
  }
  

  }*/
  }


