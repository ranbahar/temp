import { Injectable } from '@nestjs/common';

@Injectable({})
export class AuthService {
  login() {
    return 'I am sign in';
  }

  signup() {
    return 'I am sign up';
  }
}
