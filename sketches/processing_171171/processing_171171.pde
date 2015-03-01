
/*
by Adriano Parracciani
aka CyberParra

click the mouse over the single square
to change color from black/white

press n key to set grid off
press y key to set grid on
press s to save image file (the file name is GridAdrt.jpg)

*/

void setup() {
size(401,401);
//noLoop();
frameRate(5);
stroke(0);
}

int x=0;
int y=0;
int lato=50;
int col11=255; 
int col21=255;
int col31=255;
int col41=255; 
int col51=255;
int col61=255;
int col71=255;
int col81=255;
int col12=255; 
int col22=255;
int col32=255;
int col42=255; 
int col52=255;
int col62=255;
int col72=255;
int col82=255;
int col13=255; 
int col23=255;
int col33=255;
int col43=255; 
int col53=255;
int col63=255;
int col73=255;
int col83=255;

int col14=255; 
int col24=255;
int col34=255;
int col44=255; 
int col54=255;
int col64=255;
int col74=255;
int col84=255;

int col15=255; 
int col25=255;
int col35=255;
int col45=255; 
int col55=255;
int col65=255;
int col75=255;
int col85=255;

int col16=255; 
int col26=255;
int col36=255;
int col46=255; 
int col56=255;
int col66=255;
int col76=255;
int col86=255;

int col17=255; 
int col27=255;
int col37=255;
int col47=255; 
int col57=255;
int col67=255;
int col77=255;
int col87=255;

int col18=255; 
int col28=255;
int col38=255;
int col48=255; 
int col58=255;
int col68=255;
int col78=255;
int col88=255;


void draw() {

  //row1
  
  //q11  
fill (col11);  
rect(0,0, lato,lato);
 
 //q21 
fill (col21);  
rect(50,0, lato,lato);

 //q31 
fill (col31);  
rect(100,0, lato,lato); 

 //q41 
fill (col41);  
rect(150,0, lato,lato);

 //q51 
fill (col51);  
rect(200,0, lato,lato);

 //q61 
fill (col61);  
rect(250,0, lato,lato);

 //q71 
fill (col71);  
rect(300,0, lato,lato);

 //q81 
fill (col81);  
rect(350,0, lato,lato);

//row2
  
  //q12 
fill (col12);  
rect(0,50, lato,lato);
 
 //q22 
fill (col22);  
rect(50,50, lato,lato);

 //q32
fill (col32);  
rect(100,50, lato,lato); 

 //q42 
fill (col42);  
rect(150,50, lato,lato);

 //q52 
fill (col52);  
rect(200,50, lato,lato);

 //q62 
fill (col62);  
rect(250,50, lato,lato);

 //q72 
fill (col72);  
rect(300,50, lato,lato);

 //q82 
fill (col82);  
rect(350,50, lato,lato);

//row3

  //q13
fill (col13);  
rect(0,100, lato,lato);
 
 //q23 
fill(col23);  
rect(50,100, lato,lato);

 //q33
fill (col33);  
rect(100,100, lato,lato); 

 //q43
fill (col43);  
rect(150,100, lato,lato);

 //q53 
fill (col53);  
rect(200,100, lato,lato);

 //q63 
fill (col63);  
rect(250,100, lato,lato);

 //q73 
fill (col73);  
rect(300,100, lato,lato);

 //q83 
fill (col83);  
rect(350,100, lato,lato);


//row4

  //q14
fill (col14);  
rect(0,150, lato,lato);
 
 //q24 
fill (col24);  
rect(50,150, lato,lato);

 //q34
fill (col34);  
rect(100,150, lato,lato); 

 //q44
fill (col44);  
rect(150,150, lato,lato);

 //q54 
fill (col54);  
rect(200,150, lato,lato);

 //q64 
fill (col64);  
rect(250,150, lato,lato);

 //q74 
fill (col74);  
rect(300,150, lato,lato);

 //q84 
fill (col84);  
rect(350,150, lato,lato);

//row5

  //q15
fill (col15);  
rect(0,200, lato,lato);
 
 //q25 
fill (col25);  
rect(50,200, lato,lato);

 //q35
fill (col35);  
rect(100,200, lato,lato); 

 //q45
fill (col45);  
rect(150,200, lato,lato);

 //q55 
fill (col55);  
rect(200,200, lato,lato);

 //q65 
fill (col65);  
rect(250,200, lato,lato);

 //q75
fill (col75);  
rect(300,200, lato,lato);

 //q85 
fill (col85);  
rect(350,200, lato,lato);


//row6

  //q16
fill (col16);  
rect(0,250, lato,lato);
 
 //q26 
fill (col26);  
rect(50,250, lato,lato);

 //q36
fill (col36);  
rect(100,250, lato,lato); 

 //q46
fill (col46);  
rect(150,250, lato,lato);

 //q56 
fill (col56);  
rect(200,250, lato,lato);

 //q66 
fill (col66);  
rect(250,250, lato,lato);

 //q76
fill (col76);  
rect(300,250, lato,lato);

 //q86 
fill (col86);  
rect(350,250, lato,lato);

//row7

  //q17
fill (col17);  
rect(0,300, lato,lato);
 
 //q27 
fill (col27);  
rect(50,300, lato,lato);

 //q37
fill (col37);  
rect(100,300, lato,lato); 

 //q47
fill (col47);  
rect(150,300, lato,lato);

 //q57 
fill (col57);  
rect(200,300, lato,lato);

 //q67 
fill (col67);  
rect(250,300, lato,lato);

 //q77
fill (col77);  
rect(300,300, lato,lato);

 //q87 
fill (col87);  
rect(350,300, lato,lato);

//row8

  //q18
fill (col18);  
rect(0,350, lato,lato);
 
 //q28 
fill (col28);  
rect(50,350, lato,lato);

 //q38
fill (col38);  
rect(100,350, lato,lato); 

 //q48
fill (col48);  
rect(150,350, lato,lato);

 //q58 
fill (col58);  
rect(200,350, lato,lato);

 //q68 
fill (col68);  
rect(250,350, lato,lato);

 //q78
fill (col78);  
rect(300,350, lato,lato);

 //q88 
fill (col88);  
rect(350,350, lato,lato);

}//end draw


void mousePressed() {
  
  //q11
   if ((mouseX >0) && (mouseX<50) && (mouseY>0) && (mouseY<50)) {
        if (col11==255) {
            col11=0; 
          } else if (col11==0) {
            col11=255;
           }   
     } 
     //21
     if ((mouseX >50) && (mouseX<100) && (mouseY>0) && (mouseY<50)) {
        if (col21==255) {
            col21=0; 
          } else if (col21==0) {
            col21=255;
           }   
      } 
      
      //31
     if ((mouseX >100) && (mouseX<150) && (mouseY>0) && (mouseY<50)) {
        if (col31==255) {
            col31=0; 
          } else if (col31==0) {
            col31=255;
           }   
      } 
   
    //41
     if ((mouseX >150) && (mouseX<200) && (mouseY>0) && (mouseY<50)) {
        if (col41==255) {
            col41=0; 
          } else if (col41==0) {
            col41=255;
           }   
      } 
      
      //51
     if ((mouseX >200) && (mouseX<250) && (mouseY>0) && (mouseY<50)) {
        if (col51==255) {
            col51=0; 
          } else if (col51==0) {
            col51=255;
           }   
      } 
      
       //61
     if ((mouseX >250) && (mouseX<300) && (mouseY>0) && (mouseY<50)) {
        if (col61==255) {
            col61=0; 
          } else if (col61==0) {
            col61=255;
           }   
      } 
      
      //71
     if ((mouseX >300) && (mouseX<350) && (mouseY>0) && (mouseY<50)) {
        if (col71==255) {
            col71=0; 
          } else if (col71==0) {
            col71=255;
           }   
      } 
      
      //81
     if ((mouseX >350) && (mouseX<400) && (mouseY>0) && (mouseY<50)) {
        if (col81==255) {
            col81=0; 
          } else if (col81==0) {
            col81=255;
           }   
      } 
      
      //row 2
      
    //q12
   if ((mouseX >0) && (mouseX<50) && (mouseY>50) && (mouseY<100)) {
        if (col12==255) {
            col12=0; 
          } else if (col12==0) {
            col12=255;
           }   
     } 
     //22
     if ((mouseX >50) && (mouseX<100) && (mouseY>50) && (mouseY<100)) {
        if (col22==255) {
            col22=0; 
          } else if (col22==0) {
            col22=255;
           }   
      } 
      
      //32
     if ((mouseX >100) && (mouseX<150) && (mouseY>50) && (mouseY<100)) {
        if (col32==255) {
            col32=0; 
          } else if (col32==0) {
            col32=255;
           }   
      } 
   
    //42
     if ((mouseX >150) && (mouseX<200) && (mouseY>50) && (mouseY<100)) {
        if (col42==255) {
            col42=0; 
          } else if (col42==0) {
            col42=255;
           }   
      } 
      
      //52
     if ((mouseX >200) && (mouseX<250) && (mouseY>50) && (mouseY<100)) {
        if (col52==255) {
            col52=0; 
          } else if (col52==0) {
            col52=255;
           }   
      } 
      
       //62
     if ((mouseX >250) && (mouseX<300) && (mouseY>50) && (mouseY<100)) {
        if (col62==255) {
            col62=0; 
          } else if (col62==0) {
            col62=255;
           }   
      } 
      
      //72
     if ((mouseX >300) && (mouseX<350) && (mouseY>50) && (mouseY<100)) {
        if (col72==255) {
            col72=0; 
          } else if (col72==0) {
            col72=255;
           }   
      } 
      
      //82
     if ((mouseX >350) && (mouseX<400) && (mouseY>50) && (mouseY<100)) {
        if (col82==255) {
            col82=0; 
          } else if (col82==0) {
            col82=255;
           }   
      } 
      
      //row 3
      
      //q13
   if ((mouseX >0) && (mouseX<50) && (mouseY>100) && (mouseY<150)) {
        if (col13==255) {
            col13=0; 
          } else if (col13==0) {
            col13=255;
           }   
     } 
     //23
     if ((mouseX >50) && (mouseX<100) && (mouseY>100) && (mouseY<150)) {
        if (col23==255) {
            col23=0; 
          } else if (col23==0) {
            col23=255;
           }   
      } 
      
      //33
     if ((mouseX >100) && (mouseX<150) && (mouseY>100) && (mouseY<150)) {
        if (col33==255) {
            col33=0; 
          } else if (col33==0) {
            col33=255;
           }   
      } 
   
    //43
     if ((mouseX >150) && (mouseX<200) && (mouseY>100) && (mouseY<150)) {
        if (col43==255) {
            col43=0; 
          } else if (col43==0) {
            col43=255;
           }   
      } 
      
      //53
     if ((mouseX >200) && (mouseX<250) && (mouseY>100) && (mouseY<150)) {
        if (col53==255) {
            col53=0; 
          } else if (col53==0) {
            col53=255;
           }   
      } 
      
       //63
     if ((mouseX >250) && (mouseX<300) && (mouseY>100) && (mouseY<150)) {
        if (col63==255) {
            col63=0; 
          } else if (col63==0) {
            col63=255;
           }   
      } 
      
      //73
     if ((mouseX >300) && (mouseX<350) && (mouseY>100) && (mouseY<150)) {
        if (col73==255) {
            col73=0; 
          } else if (col73==0) {
            col73=255;
           }   
      } 
      
      //83
     if ((mouseX >350) && (mouseX<400) && (mouseY>100) && (mouseY<150)) {
        if (col83==255) {
            col83=0; 
          } else if (col83==0) {
            col83=255;
           }   
      } 
      
     
      
      //row4
      
      //q14
   if ((mouseX >0) && (mouseX<50) && (mouseY>150) && (mouseY<200)) {
        if (col14==255) {
            col14=0; 
          } else if (col14==0) {
            col14=255;
           }   
     } 
     //24
     if ((mouseX >50) && (mouseX<100) && (mouseY>150) && (mouseY<200)) {
        if (col24==255) {
            col24=0; 
          } else if (col24==0) {
            col24=255;
           }   
      } 
      
      //34
     if ((mouseX >100) && (mouseX<150) && (mouseY>150) && (mouseY<200)) {
        if (col34==255) {
            col34=0; 
          } else if (col34==0) {
            col34=255;
           }   
      } 
   
    //44
     if ((mouseX >150) && (mouseX<200) && (mouseY>150) && (mouseY<200)) {
        if (col44==255) {
            col44=0; 
          } else if (col44==0) {
            col44=255;
           }   
      } 
      
      //54
     if ((mouseX >200) && (mouseX<250) && (mouseY>150) && (mouseY<200)) {
        if (col54==255) {
            col54=0; 
          } else if (col54==0) {
            col54=255;
           }   
      } 
      
       //64
     if ((mouseX >250) && (mouseX<300) && (mouseY>150) && (mouseY<200)) {
        if (col64==255) {
            col64=0; 
          } else if (col64==0) {
            col64=255;
           }   
      } 
      
      //74
     if ((mouseX >300) && (mouseX<350) && (mouseY>150) && (mouseY<200)) {
        if (col74==255) {
            col74=0; 
          } else if (col74==0) {
            col74=255;
           }   
      } 
      
      //84
     if ((mouseX >350) && (mouseX<400) && (mouseY>150) && (mouseY<200)) {
        if (col84==255) {
            col84=0; 
          } else if (col84==0) {
            col84=255;
           }   
      } 
      
     //row5
     
      //q15
   if ((mouseX >0) && (mouseX<50) && (mouseY>200) && (mouseY<250)) {
        if (col15==255) {
            col15=0; 
          } else if (col15==0) {
            col15=255;
           }   
     } 
     //25
     if ((mouseX >50) && (mouseX<100) && (mouseY>200) && (mouseY<250)) {
        if (col25==255) {
            col25=0; 
          } else if (col25==0) {
            col25=255;
           }   
      } 
      
      //35
     if ((mouseX >100) && (mouseX<150) && (mouseY>200) && (mouseY<250)) {
        if (col35==255) {
            col35=0; 
          } else if (col35==0) {
            col35=255;
           }   
      } 
   
    //45
     if ((mouseX >150) && (mouseX<200) && (mouseY>200) && (mouseY<250)) {
        if (col45==255) {
            col45=0; 
          } else if (col45==0) {
            col45=255;
           }   
      } 
      
      //55
     if ((mouseX >200) && (mouseX<250) && (mouseY>200) && (mouseY<250)) {
        if (col55==255) {
            col55=0; 
          } else if (col55==0) {
            col55=255;
           }   
      } 
      
       //65
     if ((mouseX >250) && (mouseX<300) && (mouseY>200) && (mouseY<250)) {
        if (col65==255) {
            col65=0; 
          } else if (col65==0) {
            col65=255;
           }   
      } 
      
      //75
     if ((mouseX >300) && (mouseX<350) && (mouseY>200) && (mouseY<250)) {
        if (col75==255) {
            col75=0; 
          } else if (col75==0) {
            col75=255;
           }   
      } 
      
      //85
     if ((mouseX >350) && (mouseX<400) && (mouseY>200) && (mouseY<250)) {
        if (col85==255) {
            col85=0; 
          } else if (col85==0) {
            col85=255;
           }   
      } 
   //row6 
   
    //q16
   if ((mouseX >0) && (mouseX<50) && (mouseY>250) && (mouseY<300)) {
        if (col16==255) {
            col16=0; 
          } else if (col16==0) {
            col16=255;
           }   
     } 
     //26
     if ((mouseX >50) && (mouseX<100) && (mouseY>250) && (mouseY<300)) {
        if (col26==255) {
            col26=0; 
          } else if (col26==0) {
            col26=255;
           }   
      } 
      
      //36
     if ((mouseX >100) && (mouseX<150) && (mouseY>250) && (mouseY<300)) {
        if (col36==255) {
            col36=0; 
          } else if (col36==0) {
            col36=255;
           }   
      } 
   
    //46
     if ((mouseX >150) && (mouseX<200) && (mouseY>250) && (mouseY<300)) {
        if (col46==255) {
            col46=0; 
          } else if (col46==0) {
            col46=255;
           }   
      } 
      
      //56
     if ((mouseX >200) && (mouseX<250) && (mouseY>250) && (mouseY<300)) {
        if (col56==255) {
            col56=0; 
          } else if (col56==0) {
            col56=255;
           }   
      } 
      
       //66
     if ((mouseX >250) && (mouseX<300) && (mouseY>250) && (mouseY<300)) {
        if (col66==255) {
            col66=0; 
          } else if (col66==0) {
            col66=255;
           }   
      } 
      
      //76
     if ((mouseX >300) && (mouseX<350) && (mouseY>250) && (mouseY<300)) {
        if (col76==255) {
            col76=0; 
          } else if (col76==0) {
            col76=255;
           }   
      } 
      
      //86
     if ((mouseX >350) && (mouseX<400) && (mouseY>250) && (mouseY<300)) {
        if (col86==255) {
            col86=0; 
          } else if (col86==0) {
            col86=255;
           }   
      } 
      
      //row7
      
      //q17
   if ((mouseX >0) && (mouseX<50) && (mouseY>300) && (mouseY<350)) {
        if (col17==255) {
            col17=0; 
          } else if (col17==0) {
            col17=255;
           }   
     } 
     //27
     if ((mouseX >50) && (mouseX<100) && (mouseY>300) && (mouseY<350)) {
        if (col27==255) {
            col27=0; 
          } else if (col27==0) {
            col27=255;
           }   
      } 
      
      //37
     if ((mouseX >100) && (mouseX<150) && (mouseY>300) && (mouseY<350)) {
        if (col37==255) {
            col37=0; 
          } else if (col37==0) {
            col37=255;
           }   
      } 
   
    //47
     if ((mouseX >150) && (mouseX<200) && (mouseY>300) && (mouseY<350)) {
        if (col47==255) {
            col47=0; 
          } else if (col47==0) {
            col47=255;
           }   
      } 
      
      //57
     if ((mouseX >200) && (mouseX<250) && (mouseY>300) && (mouseY<350)) {
        if (col57==255) {
            col57=0; 
          } else if (col57==0) {
            col57=255;
           }   
      } 
      
       //67
     if ((mouseX >250) && (mouseX<300) && (mouseY>300) && (mouseY<350)) {
        if (col67==255) {
            col67=0; 
          } else if (col67==0) {
            col67=255;
           }   
      } 
      
      //77
     if ((mouseX >300) && (mouseX<350) && (mouseY>300) && (mouseY<350)) {
        if (col77==255) {
            col77=0; 
          } else if (col77==0) {
            col77=255;
           }   
      } 
      
      //87
     if ((mouseX >350) && (mouseX<400) && (mouseY>300) && (mouseY<350)) {
        if (col87==255) {
            col87=0; 
          } else if (col87==0) {
            col87=255;
           }   
      } 
      
      
      //row8
      //q18
   if ((mouseX >0) && (mouseX<50) && (mouseY>350) && (mouseY<400)) {
        if (col18==255) {
            col18=0; 
          } else if (col18==0) {
            col18=255;
           }   
     } 
     //28
     if ((mouseX >50) && (mouseX<100) && (mouseY>350) && (mouseY<400)) {
        if (col28==255) {
            col28=0; 
          } else if (col28==0) {
            col28=255;
           }   
      } 
      
      //38
     if ((mouseX >100) && (mouseX<150) && (mouseY>350) && (mouseY<400)) {
        if (col38==255) {
            col38=0; 
          } else if (col38==0) {
            col38=255;
           }   
      } 
   
    //48
     if ((mouseX >150) && (mouseX<200) && (mouseY>350) && (mouseY<400)) {
        if (col48==255) {
            col48=0; 
          } else if (col48==0) {
            col48=255;
           }   
      } 
      
      //58
     if ((mouseX >200) && (mouseX<250) && (mouseY>350) && (mouseY<400)) {
        if (col58==255) {
            col58=0; 
          } else if (col58==0) {
            col58=255;
           }   
      } 
      
       //68
     if ((mouseX >250) && (mouseX<300) && (mouseY>350) && (mouseY<400)) {
        if (col68==255) {
            col68=0; 
          } else if (col68==0) {
            col68=255;
           }   
      } 
      
      //78
     if ((mouseX >300) && (mouseX<350) && (mouseY>350) && (mouseY<400)) {
        if (col78==255) {
            col78=0; 
          } else if (col78==0) {
            col78=255;
           }   
      } 
      
      //88
     if ((mouseX >350) && (mouseX<400) && (mouseY>350) && (mouseY<400)) {
        if (col88==255) {
            col88=0; 
          } else if (col88==0) {
            col88=255;
           }   
      } 
      
}//end mouse pressed

void keyPressed() {
  
  if (key=='n') {
    noStroke();
  }
  
   if (key=='y') {
    stroke(0);
  }
  
   if (key=='s') { //save image file
    save("GridArt.jpg");
  }
  
}//end of keypressed

