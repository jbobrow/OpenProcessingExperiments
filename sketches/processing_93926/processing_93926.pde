
class SteganographyImage
{
  int[] redData;
  int[] blueData;
  int[] greenData;
  
 SteganographyImage(){};
 SteganographyImage(String cover, String information, int number)
 {
     redData = new int[255];
     blueData = new int[255];
     greenData = new int[255];
   PImage coverImage = loadImage(cover);
   PImage hiddenImage = loadImage(information);
   
   int hidr =0;
   int hidg =0;
   int hidb =0;
   
   for (int x =0;x<1000;x++) {

    for (int y =0;y<1000;y++) {

      if (x<hiddenImage.width&&y<hiddenImage.height) {  
        int hidcol = hiddenImage.pixels[x+y*hiddenImage.width];
        hidr = (hidcol >> 16) & 0xFF;
        hidg = (hidcol >> 8) & 0xFF;
        hidb = hidcol & 0xFF;
        hidr=  hidr>>5;
        hidg=hidg>>5;
        hidb=hidb>>5;
      }
      else {
        hidr =0;
        hidb =0;
        hidg =0;
      }

      int col = coverImage.pixels[x+y*coverImage.width];
      int r = (col >> 16) & 0xFF;
      int g = (col >> 8) & 0xFF;
      int b = col & 0xFF;
      b= b&248;
      b = b|hidb;
      r= r&248;
      r = r|hidr;
      g= g&248;
      g = g|hidg;
      coverImage.pixels[x+y*coverImage.width]=color(r, g, b);
    }
  }
  coverImage.updatePixels();

  coverImage.save("cat" + number + ".jpg");
 }
 
 void hideText(String cover, int number)
 {
   String[] lines = loadStrings("ALLTHESHAKESPEARE.txt");
   PImage img = loadImage(cover);
   String combined = "";
   
   for(int i = 0; i < lines.length; i++)
   {
     combined += lines[i];
   }
   
   int charIndex = 0;
   
   for (int x = 0; x < img.width; x++) {
     for (int y = 0; y < img.height; y++ ) {
       
        if(charIndex >= combined.length())
          break;
        int character = combined.charAt(charIndex);
        charIndex++;
       
        int loc = x + y*img.width;
        int pixel = img.pixels[loc];
        int r = (pixel >> 16) & 0xFF;
        int g = (pixel >> 8) & 0xFF;
        int b = pixel & 0xFF;
        
        int partOfCharacterForRed = (character & 224) >> 5;
        int partOfCharacterForGreen = (character & 28) >> 2;
        int partOfCharacterForBlue = (character & 3) ;
        
        int changedRed = r & 248;
        int changedGreen = g & 248;
        int changedBlue = b & 248;
        
        
        
        color c = color(r|partOfCharacterForRed,g|partOfCharacterForGreen,b|partOfCharacterForBlue);
        
        img.pixels[loc] = c;
      }
    }
     img.updatePixels();

  img.save("romeo" + number + ".jpg");
 }
 
 void hideMoreText(String cover, int number)
 {
   String[] lines = loadStrings("ALLTHESHAKESPEARE.txt");
   PImage img = loadImage(cover);
   String combined = "";
   
   for(int i = 0; i < lines.length; i++)
   {
     combined += lines[i];
   }
   
   int charIndex = 0;
   
   for (int x = 0; x < img.width; x++) {
     for (int y = 0; y < img.height; y++ ) {
       
        if(charIndex >= combined.length())
          break;
        int character1 = combined.charAt(charIndex);
        int character2 = combined.charAt(charIndex + 1);
        charIndex += 2;
       
        int loc = x + y*img.width;
        int pixel = img.pixels[loc];
        int r = (pixel >> 16) & 0xFF;
        int g = (pixel >> 8) & 0xFF;
        int b = pixel & 0xFF;
        
        int partOfCharacter1ForRed = (character1 & 224) >> 5;
        int partOfCharacter1ForGreen = (character1 & 28) >> 2;
        int partOfCharacter1ForBlue = (character1 & 3) ;
        
        int partOfCharacter2ForRed = (character2 & 224) >> 2;
        int partOfCharacter2ForGreen = (character2 & 28) << 1;
        int partOfCharacter2ForBlue = (character2 & 3) << 3;
        
        int changedRed = r & 224;
        int changedGreen = g & 224;
        int changedBlue = b & 224;
        
        int newRedColor = (r|partOfCharacter1ForRed)|partOfCharacter2ForRed;
        int newGreenColor = (g|partOfCharacter1ForGreen)|partOfCharacter2ForGreen;
        int newBlueColor = (b|partOfCharacter1ForBlue)|partOfCharacter2ForBlue;
        
       // addColor(r,g, b);
        
        color c = color(newRedColor,newGreenColor,newBlueColor);
        
        img.pixels[loc] = c;
      }
    }
     img.updatePixels();

  img.save("romeo" + number + ".jpg");
 }
 
 void saveData()
 {
   String firstLine = "Color,Red,Blue,Green\n";
   String dataStuffs = "";
   for(int i = 0; i < 255; i ++)
   {
     
   }
 }
 
 void addColor(int r, int g, int b)
 {
   redData[r] += 1;
   greenData[g] += 1;
   blueData[b] += 1;
 }
  
}

