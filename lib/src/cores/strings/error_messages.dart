class ErrorMessages {
  const ErrorMessages._();

  static const kNoInternet = "Your device is not connected to the Internet";
  static const kPermissionDenied =
      "Permission is permanently denied.\nChange permission from the app settings and try again";
  static const kImageRequired = "Image is required";
  static const kInvalidQrCode = "Invalid QR Code";
  static const kStartDateError = "Start Date & Time must be earlier than End Date & Time";
  static const kEndDateError = "End Date & Time must be later than Start Date & Time";
  static const kUnauthenticated = "Unauthenticated";
  static const kFbAuthError = "Facebook authentication failed";
  static const kGoogleAuthError = "Google authentication failed";
  static const kAppleAuthError = "Apple authentication failed";
  static const kUnableToDecodeResponse = "Unable to decode response";
  static const kConnectionTimeout = "Connection time out";
  static const kSendTimeout = "Send time out";
  static const kReceiveTimeout = "Receive time out";
  static const kBadCertificate = "Bad certificate";
  static const kBadResponse = "Bad response";
  static const kRequestCancelled = "Request cancelled";
  static const kConnectionError = "Connection error";
  static const kServerError = "Internal Server Error";
  static const kUnknownError = "An unknown error occurred";
  static const kNoUserFound = "No user found";
  static const kConnectionClosed = "Connection closed";
  static const kInvalidPassword =
      'Must be 8 or more characters and contain at least 1 number and 1 special character';
}
