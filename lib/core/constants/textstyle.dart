import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle heading = GoogleFonts.baloo2(
  height: 2,
  fontSize: 30,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle caption = GoogleFonts.baloo2(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.grey,
);

TextStyle headingMeduim = GoogleFonts.baloo2(
    fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white);

TextStyle captionMedium = GoogleFonts.baloo2(
    fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey);

TextStyle headingRegular = GoogleFonts.baloo2(
    fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white);

TextStyle superScript = GoogleFonts.baloo2(
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontSize: 25,
    fontFeatures: [const FontFeature.enable('sups')]);
