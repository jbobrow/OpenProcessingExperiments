
//pulls in a webpage as a string array, one pre line of the page
String[] ln = loadStrings("http://www.windfinder.com/report/dundee");

//an empty tring which I will put the whole page in for searching and choping 
String pg = "";

//fixxed loop to step through each line of the web page
for (int i=0;i<ln.length;i++) {
  //unocmment me if you want to print out the whole page with line numbers
  //println(i+"] "+ln[i]);

  //adds all the lines to teh one string pg
  pg = pg + ln[i];
}

// the thing that hapend before my data
//<span class="current-windspeed ws0">

//chop up the whole string page based on the strign belwo \/
String[] bits = split(pg, "<span class=\"current-windspeed ws0\">");

// the thing that happens imediatly after my data
// Knots

// now chop the bottom half o fthe string
String[] bits2 = split(bits[1], " Knots");

// our number we want (Still a string at the moment)
println(trim(bits2[0]));


//now we need to make it a number
// the trim function strips off white space
// teh float function transforms a string to floating point number
float val = float(trim(bits2[0]));

// now we have our number
println(val);
println(val*10);


