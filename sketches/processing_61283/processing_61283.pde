
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 18-5: Parsing Yahoo's XML weather feed manually
// A WeatherGrabber class
class MusicGrabber {

  String Song = "";
  String Music = "";
  String mp3;

  MusicGrabber(String tempMp3) {
    mp3 = tempMp3;
  }

  // Set a new Zip code
  void setMp3(String tempMp3) {
    mp3 = tempMp3;
  }
  // Get the weather
  String getMusic() {
    return Music;
  }

  String getSong() {
    return Song;
  }

  // Make the actual XML request
  void requestMusic() {
    // Get all the HTML/XML source code into an array of strings
    // (each line is one element in the array)
    String url = "http://feeds.feedburner.com/pantsdance" + mp3;
    String[] lines = loadStrings(url);

    // Turn array into one long String
    String html = join(lines, ""); 

    // Searching for weather condition
    String lookfor = "<a href=\"";
    // String lookfor = "<enclosure url=\"";
    //String lookfor = "<media:content url\="";
    String end =".mp3";
    mp3 = giveMeTextBetween(html, lookfor, end);
    //New Stuff added
    mp3=mp3+".mp3";
    mp3=url;
    mp3="http://s3.amazonaws.com/mad_decent_production/public/system/uploads/files/10368/original/01_Sinden_Kiss_100_2011_12_12_qrip.mp3";
    lookfor = "title=\"";
    Music = giveMeTextBetween(html, lookfor, end);
  }

  // A function that returns a substring between two substrings
  String giveMeTextBetween(String s, String before, String after) {
    String found = "";
    int start = s.indexOf(before);    // Find the index of the beginning tag
    if (start == - 1) return"";       // If we don't find anything, send back a blank String
    start += before.length();         // Move to the end of the beginning tag
    int end = s.indexOf(after, start); // Find the index of the end tag
    if (end == -1) return"";          // If we don't find the end tag, send back a blank String
    return s.substring(start, end);    // Return the text in between
  }
}


