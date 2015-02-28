
String[] speakers = {
  "Margaret Bourdeaux", "Deborah Harmon-Hines", "Carla Gomes", "Lisa Thiel", "David Edwards", "Leonore Herzenberg", "David Scadden", "Susan Graham", "Meg Urry", "Melissa Franklin", "Pardis Sabeti", "Richard Losick", "David Charbonneau", "Pamela Silver", "Dudley Herschbach", "Paul Reville", "Danielle Feinberg"};
String[] institutions = {
  "Harvard Medical School", "University of Massachusettes", "Cornell University", " ", "Harvard University", "Stanford University", "Harvard University", "University of California, Berkeley", "Yale University", "Harvard University", "Harvard University", "Harvard University", "Harvard University", "Harvard University", "Harvard University", "Harvard University", "MA Secretary of Education", "Pixar Lighting Director"};
PFont plotFont;
PFont plotFont2; 
PFont titleFont;
PImage img; 
PImage sum;
PImage title; 
PImage blurb;


        
void setup()
{
  plotFont = createFont("SansSerif", 14); 
  plotFont2 = createFont("Georgia", 18);
  titleFont = createFont("Verdana", 19);
  textFont(plotFont); 
    size(900, 600);

}

void draw()
{

  background(0);
      fill(255);
        textFont(titleFont);
        text("National Symposium for the Advancement of Women in Science: Speaker Biographies", 50, 50);
               text("(more to come)", 400, 80);
          textFont(plotFont);
  fill(100);
  for( int b = 0; b < 17; b+=1)
  {
    fill(#222222 + 10*b);
    rect(50,(100 + b*25),200,20);
  }
  for(int a = 0; a < 17; a+=1)
  {
    fill(255);
    text(speakers[a], 60, 120 + a*25);
    if(get(mouseX, mouseY)==(#222222 + 10*a))
    {
      fill(100);
      img = loadImage(speakers[a] + ".jpg");
      //sum = loadImage("danielle.jpg");
      title = loadImage("title.jpg");
      blurb = loadImage(speakers[a] + " Blurb.jpg");
      if(img != null)    
        {image(img, 280, 100, 300, ((300.0/img.width)*img.height) );}
      if(blurb != null)
      image(blurb, 500, 150, 380, ((400.0/blurb.width)*blurb.height) );
      //image(title, 50, 50, 600, ((600.0/title.width)*title.height));
        textFont(plotFont2);
        fill(#5555BB);
        text(speakers[a], 600 ,100);
        fill(#8888FF);
        text(institutions[a], 600, 130 );
        fill(255);
        textFont(titleFont);
        text("National Symposium for the Advancement of Women in Science: Speaker Biographies", 50, 50);
 
        textFont(plotFont);
    }
  }

 


}


