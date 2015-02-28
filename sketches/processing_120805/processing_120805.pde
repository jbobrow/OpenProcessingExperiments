
byte buffer[];
int data = 0;
int pointer = 0;
int lines;

class HexEntry {
  byte count;
  int address;
  byte type;
  byte[] data;
  byte checksum;
}

HexEntry[] hexEntries;
void setup() {
  buffer = loadBytes("file.hex");
  for(int i = 0; i < buffer.length; i++)
    if(buffer[i] == 58) lines++;
    hexEntries = new HexEntry[lines];
  
    for(int j = 0; j < lines; j++) {
      hexEntries[j] = new HexEntry();
      // Line Start Skip
      if(buffer[pointer] == 58) pointer++;  
      // Get byte count
      print(pointer + " ");  
      hexEntries[j].count = getByte();
      hexEntries[j].address = getWord();
  
      hexEntries[j].type = getByte();  
      hexEntries[j].data = new byte[hexEntries[j].count];

      for(int i = 0; i < hexEntries[j].count; i++)
      {    
        hexEntries[j].data[i] = getByte();
      }
 
      hexEntries[j].checksum = getByte();

      println("Count: 0x" + hex(hexEntries[j].count, 2));
      println("Address: 0x" + hex(hexEntries[j].address, 2));
      println("Type: 0x" + hex(hexEntries[j].type, 2));
      print("Data: ");
      for(int i = 0; i < hexEntries[j].count; i++)
        print("0x" + hex(hexEntries[j].data[i], 2) + " ");
      println();
      println("Checksum: 0x" + hex(hexEntries[j].checksum, 2));
      println();  
      if(buffer[pointer] == 13) pointer++;
      if(buffer[pointer] == 10) pointer++;
    }
}
byte getByte() {
  data = (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  data = data << 4; pointer++;
  data += (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  pointer++;
  return byte(data);
}

int getWord() {
  data = (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  data = data << 4; pointer++;
  data += (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  data = data << 4; pointer++;
  data += (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  data = data << 4; pointer++;
  data += (buffer[pointer] < 58)? buffer[pointer] - 48: buffer[pointer] - 55;
  pointer++;
  return data;
}


