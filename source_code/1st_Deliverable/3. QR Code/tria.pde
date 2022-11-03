import qrcodeprocessing.*;

PImage img;

Decoder decoder;


void setup(){
  size(270,270);
  img = loadImage("qr-code.png");
  
  decoder = new Decoder(this);
  decoder.decodeImage(img);
}

void decoderEvent(Decoder decoder){
  String statusMsg = decoder.getDecodedString();
  println(statusMsg);
  
  link(statusMsg);}

void draw(){
  image(img, 0, 0, 2, 2);
}
