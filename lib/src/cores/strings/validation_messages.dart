class ValidationMessages {
  const ValidationMessages._();

  static const kRequired = "Field must not be empty";
  static const kEmail = "Email is not valid";
//Because we have used the must match validator for password confirmation only
  static const kMustMatch = "Passwords do not match";
  static const kOtpError = "Invalid OTP";
  static const kDeviceIdMinLength = "Must be 15 or more digits";
}
