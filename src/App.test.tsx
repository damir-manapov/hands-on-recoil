import { describe, it, expect, vi } from 'vitest';
import { render, screen } from '@testing-library/react';
import App from './App';

vi.mock('recoil', () => ({
	RecoilRoot: ({ children }: { children: React.ReactNode }) => <>{children}</>,
	useRecoilState: () => [0, vi.fn()],
	atom: vi.fn((config: { key: string; default: number }) => config),
}));

describe('App', () => {
	it('renders the app title', () => {
		render(<App />);
		expect(screen.getByText('Hands-on Recoil')).toBeInTheDocument();
	});

	it('renders the counter button', () => {
		render(<App />);
		expect(screen.getByText(/count is/i)).toBeInTheDocument();
	});
});
