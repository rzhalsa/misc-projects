import sys

# loan_balance_calculator.py
#
# Calculates the remaining loan balance and interest paid of an amortized loan after a provided number of months. 
#
# Author: Ryan McHenry
# Date: October 26, 2025

def main():
    # Get user input
    print("What is the total balance of the loan? (Format as 1234.56): ", end="")
    loan_balance = float(input())
    loan_balance_copy = loan_balance
    print("What is the APR? (Format as 1.23): ", end="")
    apr = float(input())
    print("What is the monthly payment in dollars? (Format as 123.45): ", end="")
    monthly_payment_amt = float(input())
    print("How much extra do you pay above the minimum each month? If none, answer 0. (Format 123.45): ", end="")
    extra_payment_amt = float(input())
    print("How many months into the future would you like to see your balance? (Format as an integer): ", end="")
    num_months = int(input())

    # Calculate current interest amount
    interest = calculate_interest(loan_balance, apr)
    total_interest_paid = interest

    # Use for loop to calculate remaining balance and interest paid each month
    for _ in range(num_months):
        if loan_balance >= (monthly_payment_amt + extra_payment_amt) - interest:
            loan_balance -= (monthly_payment_amt + extra_payment_amt - interest)
        else:
            loan_balance = 0
            total_interest_paid += interest
            break
        interest = calculate_interest(loan_balance, apr)
        total_interest_paid += interest

    # Print out remaining balance and amount of interest paid
    print(f"\nLoan balance in {num_months} months: ${loan_balance:.2f}")
    print(f"Total interest paid: {total_interest_paid:.2f} \n")

def calculate_interest(total, apr):
    return (total * (apr / 100)) / 12

if __name__ == "__main__":
    main()