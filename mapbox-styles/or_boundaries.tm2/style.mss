#region-boundaries-no-maritime[zoom>=7]{
  line-opacity: 0.25;
  line-join: round;
  line-width: 1.75px;
  line-color: #000;
  [zoom>=8]{ 
    line-width: 2px; 
  }
  [zoom>=9]{
    line-opacity: 0.5;
  }
  [zoom>=10]{
    line-opacity: 0.75;
    line-width: 3px;
  }
  [zoom>=12]{
    line-width: 6px;
  }
}

#Palawan[zoom>=13]{
  line-opacity: 0.5;
  line-join: round;
  line-width: 2px;
  line-color: #070707;
  line-dasharray: 8,8;
}

#prov-boundaries-no-maritime[zoom>=9]{
  line-join: round;
  line-width: 0.75px;
  line-color: #000;
  [zoom>=10]{ line-width: 1.5px; }
  [zoom>=12]{ line-width: 4px; }
}

#mun-boundaries-no-maritime[zoom>=11]{
  line-join: round;
  line-dasharray: 8,8;
  line-width: 1.5px;
  line-color: #000;
  [zoom>=12]{
    line-width: 2px;
  }
}

#region-labels{
  [zoom>=7]{
  text-name: '[NAME]';
  text-face-name: 'Roboto Bold';
  text-fill: #efefef;
  text-size: 12;
  text-halo-fill: #333;
  text-halo-radius: 1.5;
  text-wrap-width: 50;
  }
  [zoom>=9]{ text-size: 14; }
  [zoom>=10]{ text-size: 16; }
  [zoom>=11]{ text-size: 20; }
  [zoom>=12]{ text-size: 24; }
}


#prov-labels[zoom>=9]{
  text-name: '[NAME]';
  text-face-name: 'Roboto Bold';
  text-fill: #efefef;
  text-halo-fill: #333;
  text-size: 10;
  text-halo-radius: 1.5;
  text-wrap-width: 50;
  [zoom>10]{ text-size: 12; }
  [zoom>=11]{
    text-size: 14;
    text-halo-radius: 2;
  }
  [zoom>=12]{ text-size: 15; }
  [zoom>=14]{ text-size: 18; }
}

#mun-labels[zoom>=11]{
  text-name: '[NAME]';
  text-face-name: 'Roboto Regular';
  text-fill: #efefef;
  text-halo-fill: #333;
  text-size: 12;
  text-halo-radius: 1.5;
  text-wrap-width: 50;
  [zoom>=12]{ text-size: 14; }
  [zoom>=14]{ text-size: 18; }
}

#Palawan_labels[zoom>=13]{
  text-name: '[NAME]';
  text-face-name: 'Roboto Regular';
  text-fill: #efefef;
  text-halo-fill: #333;
  text-size: 8;
  text-halo-radius: 1.5;
  text-wrap-width: 50;
  [zoom>=12]{ text-size: 11; }
  [zoom>=14]{ text-size: 14; }
}
