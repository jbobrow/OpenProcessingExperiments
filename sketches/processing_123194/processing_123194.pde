
/*
Glenna Xie
 Project 3: Data Discoveries
 12/9/13
 */

import de.bezier.data.*;

XlsReader reader;

String genre;
color value;
String[] MovieInfo = new String[100];
String[] genres = new String[14];
int[] count = new int[14];
color[] colors = new color[14];
String[] movies = new String[100];
int[] years = new int[100];
String[] MovieGenres = new String[100];
float[] rates = new float[100];
float[] indexes = new float[100];


void setup ()
{
  background( 255 );
  size( 1020, 600);
  smooth();
  //Genre setup
  String[] genres = {
    "Comedy", "Action", "Crime", "Animation", "Documentary", "Biography", "Family", "Fantasy", "Romance", "Sci-Fi", "History", "Mystery", "Musical", "Drama"
  };
  color[] colors = {
    #FFFF00, #1E90FF, #DC143C, #9ACD32, #BDB76B, #FF7F50, #FF8C00, #BA55D3, #FF69B4, #4169E1, #D2691E, #BC8F8F, #3CB371, #778899
  };
  reader = new XlsReader( this, "DataSheet.xls" );
  for ( int i=0;i<=99;i++)    // loop thru rows
  { 
    String genre = reader.getString(i, 2);
    //    println(genre);
    for (int j=0;j<=12;j++) {
      if (genre.contains(genres[j]) == true) {
        count[j]++;
      }
      noStroke();
      fill(colors[j]);
      rect(475+sum(count, 13)[j]*5, 530, count[j]*5, 20);
    }
    if (genre.equals(genres[13]) == true) {
      count[13]++;
      noStroke();
      fill(colors[13]);
      rect(930, 530, count[13]*5, 20);
    }
  }
  //end
  //main barchart
  for (int h =0;h<=99;h++) {

    movies[h] = reader.getString(h, 0);
//    println(movies);

    years[h] =  reader.getInt(h, 1);
    //    println(year);

    MovieGenres[h] = reader.getString(h, 2);
//    println(MovieGenres);

    //for the colors 
    String genre = reader.getString(h, 2);
    for (int k=0;k<=12;k++) {
      if (genre.contains(genres[k]) == true) {
        value = colors[k];
      }
    }
    if (genre.equals(genres[13]) == true) {
      value = colors[13];
    }

    rates[h] =reader.getFloat(h, 3);
    //    println(rate);

    indexes[h] = reader.getFloat(h, 4);
    //    println(index);

    MovieInfo[h] = "Year: " + years[h]  + "        Movie: " + movies[h] + "         Genre: " + MovieGenres[h]  + "        Rate: " +rates[h];
    noStroke();
    fill(value);
    rect(indexes[h], 400, 10, -(rates[h]-8.6)*400);
  }
}
int[] sum(int[] array, int index) {
  int[] result_array = new int[index];
  for (int i=0; i<index; i++) {
    int result=0;
    for (int j=0; j<i; j++) {
      result += array[j];
      result_array[i] = result;
    }
  }
  return result_array;
}

void draw() {  
  fill(255);
  rect(200, 8, 800, 30);
  rect(800,560,200,20);
  fill(0);
  textSize(20);
  text("Top 100 Rated American Movies in China", 250, 25);
  textSize(12);
  text("(Rate is based on a 10-point scale)", 670, 25);
  textSize(12);
  text("(Data Source: www.douban.com)", 800, 580);
  text("1920", 0, 425);
  text("1970", 250, 425);
  text("1990", 410, 425);
  text("2000", 700, 425);
  text("2010", 880, 425);
  //Interactive Barchart 
  for (int h=0;h<=99;h++) {
    if (mouseX>=indexes[h] && mouseX<indexes[h]+10 && mouseY >=50 && mouseY<400) {
      fill(255);
      rect(180, 460, 860, 25 );
      fill(0);
      textSize(15);
      text(MovieInfo[h], 200, 480);
      fill(255);
      rect(0, 400, 1020, 15);
      fill(150);
      triangle((indexes[h]*2 +10)/2, 400, indexes[h], 410, indexes[h]+10, 410);
    }
  }
  //Interactive Genre Labels
   String[] genres = {
    "Comedy", "Action", "Crime", "Animation", "Documentary", "Biography", "Family", "Fantasy", "Romance", "Sci-Fi", "History", "Mystery", "Musical", "Drama"
  };
  fill(255);
  rect(585,480,500,25);
  fill(0);
  textSize(14);
  text("Mouse over the colored labels to see more", 585, 500);
  for (int j=0;j<=12;j++) {
    if (mouseX>=475+sum(count, 13)[j]*5 && mouseX<475+sum(count, 13)[j]*5+count[j]*5 && mouseY>=530 && mouseY<=550) {
      fill(255);
      rect(400,510,650,20);
      fill(0);
      println(genres);
      textSize(12);
      text(genres[j] + " :" + count[j], 475+sum(count, 13)[j]*5, 520);
    } else if (mouseX>=930 && mouseX<=930 + count[13]*5 && mouseY>=530 && mouseY<=550) {
       fill(255);
      rect(400,510,650,20);
      fill(0);
      text(genres[13] + " :" + count[13], 950,520);
    }
  }
}


