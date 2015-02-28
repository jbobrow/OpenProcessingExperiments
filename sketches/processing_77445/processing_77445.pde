

//pull the page in string array one 
String[] page = loadStrings("http://www.twitter.com/mike_crabb");

// a string to put the put the whole page in
String wholePage="";


// this fixxed loop will step thorgh the first third of the web pages source
for (int i=0; i<page.length/3;i++) {

  //un comment ot to display each line with line number
  //  println(i+"] "+page[i]);

  //this line adds all the lines to one big String
  wholePage += page[i];
}


//println(page[431]);

// this is to the left of the text we want <p class="bio ">
// cut the whole page in half about the marker tag
String[] bit = split(wholePage, "<p class=\"bio \">");

// now cut what remains about the closing p tag
String[] nextBit = split(bit[1], "</p>");

//now we have our string!
// to diaplay
println(nextBit[0]);



