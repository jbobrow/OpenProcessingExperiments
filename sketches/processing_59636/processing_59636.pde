
class Content { // creates a class called content

  String subject; // creates a string variable called subject
  String sender; // creates a string variable called sender
  String reciever; // creates a string variable called reciever
  String attach; // creates a string variable called attach
  Date date; // creates a Date variable called date
  int hr; // creates a number (hour) variable called hr
  int dayofyr; // creates a number (day) variable called dayofyr
  int yr; // creates a number (year) variable called yr
  String dayofwk; // creates a string (ie, Mon) variable called dayofweek
  String category; // creates a string variable called subject

  Content(String data_in) { //gets the data from the main sketch
    String[] bits  = split(data_in, ","); // splits the data into the String array using comma's

    subject = trim(bits[0]); // subject string is found in the first position of the data
    sender = trim(bits[1]); //sender string is found in the second position of the data

    SimpleDateFormat sdf =  new SimpleDateFormat("d/MM/yyyy kk:mm"); // simpleDateFormat is what we need to import the java library for. this is declaring it as sdf
    try { // need to "try to use it" by parsing the date into it
      date = sdf.parse(trim(bits[2])); // the date is found in the 3rd position of the data
    } 

    catch (Exception E) { //if it doesn't work it needs to be given instructions on what to do just in cast.
      println(E); // tells it to print the exception if it fails
    }

    SimpleDateFormat hours = new SimpleDateFormat("k"); // finds the 24hour time form of "date"
    hr = int (hours.format(date)); // stores it in hr

    SimpleDateFormat daysoftheyear = new SimpleDateFormat("D"); // finds the day number with in the year - not month
    dayofyr = int (daysoftheyear.format(date)); // stores it in dayofyr

    SimpleDateFormat daysoftheweek = new SimpleDateFormat("E"); // finds the day String of the date in the week. ei Mon, Tues...etc
    dayofwk = daysoftheweek.format(date); // stores that in dayofwk

    SimpleDateFormat year = new SimpleDateFormat("yyyy"); //finds the year of the date
    yr = int (year.format(date));//stores it in yr

    attach = trim(bits[3]); // attach is found in the 4th position of the data
    category = trim(bits[4]); //category is found in the 5th position of the data
    reciever = trim(bits[5]); //reciever is found in the 6th position of the data
  }
}


