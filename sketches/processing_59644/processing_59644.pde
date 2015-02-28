
class film {
  int rates;
  int years;
  String[] Genres; // store the genres as an array of strings
  int numVote;
  String titles;
  String titleType;
  String Directors;
  int fullRate;
  int image_irn;
  String genrestring;
  PImage thumb = null;
  String linkk;


  film(String data_in) {
    String[] bits = split(data_in, "\t"); 
    rates = int(trim(bits[8]));
    linkk = trim(bits[15]);
    println(linkk);
    years = int(trim(bits[11]));
    image_irn = int(trim(bits[0]));
    // println(years);
    //genrestring = trim(bits[12]);
    genrestring = trim(bits[12]);
    if (genrestring.length() > 0) { // if we have a genre
      if (genrestring.charAt(0) == '"') genrestring = genrestring.substring(1, genrestring.length()-1);
      // if the first char is a quote mark, then we need to chop off the first and last chars - they will be quotes
      //println(genrestring);
      Genres = trim(split(genrestring, ",")); // split at the commas and trim the strings inside
    }
    //println(genrestring);
    //prinln(types);
    numVote = int(trim(bits[13]));
    titles = trim(bits[5]);
    titleType = trim(bits[6]);
    Directors = trim(bits[7]);
    //println(titles);
    fullRate = int(trim(bits[9]));
  }



  void loadThumb() {
    //if (image_irn == null) return; // if no image, do nothing
    thumb = loadImage("filmimage/" + image_irn + "-1.jpg");
    //thumb.resize(50,75);
  }
}


