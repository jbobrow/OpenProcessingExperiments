
String[] set1 = { "cranial", "intestinal", "brain","liver","appendix","spontaneous","spinal","foot","toenail","bowel","hair","kidney","spleen","bladder","arterial","nerve","joint","lung","tongue"}; 
String[] set2 = { "hemmorhaging", "separation", "seepage","pain","combustion","implosion","swelling","inflammation","loss","shriveling","bleeding","itching","burning","rash","dysfunction","bloating","damage"};
String[] set3={"depression","vomiting","nausea","heart burn","diarrhea","fever","anxiety"};

void setup()
{
  size(500,500);
  noStroke();
  smooth();
  background(40);
}

void draw()
{
  
}
void mouseClicked()
{
    PFont font1;
    font1 = loadFont("CourierNewPSMT-48.vlw");
   
    fill(#E8B850);
    rect(165,140,175,300);
    ellipse(252,436,176,50);
    fill(#AA8345);
    ellipse(253,435,165,40);
    fill(#F5D260);
    rect(325,150,10,150);
    rect(325,330,10,20);
    
    fill(#7baf8d);
    ellipse(200,430,30,20);
    ellipse(230,440,30,20);
    ellipse(245,425,30,20);
    ellipse(280,427,30,20);
    
    fill(255);
    rect(175,155,155,200);
    fill(#FCC6B0);
    rect(180,160,145,30);
    
    fill(0);
    textFont(font1,14);
    text("Warning:",220,180);
    textFont(font1,10);
    text("May cause side effects:",187,200);
    
    fill(#EAE4CE);
    rect(152,100,200,50);
    fill(255);
    rect(157,105,190,40);
    
  
   
    for(int i=0; i<11;i++)
    {
         int randNum= round(random(0,18));
         int randNum2=round(random(0,16));
         int randNum3=round(random(0,6));
         println(set1[randNum]+" "+set2[randNum2]);
          
         textFont(font1,10);
         fill(50);
         
         if(i%4==0)
          {
            text(set3[randNum3],187,220+i*11);
          } 
          
         else
         {
           text(set1[randNum]+" "+set2[randNum2],187,220+i*11);
         }
    }
  
   
}

