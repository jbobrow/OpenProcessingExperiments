
class Content { // creates a class called content

    String subject; // creates a string variable called subject
  String sender; // creates a string variable called sender
  String reciever; // creates a string variable called reciever
  String attach; // creates a string variable called attach
  String date; // creates a Date variable called date
  String category; // creates a string variable called subject

  Content(String data_in) { //gets the data from the main sketch
    String[] bits  = split(data_in, ","); // splits the data into the String array using comma's

    subject = trim(bits[0]); // subject string is found in the first position of the data
    sender = trim(bits[1]); //sender string is found in the second position of the data
    date = trim(bits[2]); // the date is found in the 3rd position of the data
    attach = trim(bits[3]); // attach is found in the 4th position of the data
    category = trim(bits[4]); //category is found in the 5th position of the data
    reciever = trim(bits[5]); //reciever is found in the 6th position of the data
  }
}


